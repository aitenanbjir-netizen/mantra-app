import { NextResponse } from 'next/server';
import {
  CHAT_MAX_HISTORY,
  CHAT_MAX_INPUT_CHARS,
  CHAT_MAX_TOKENS,
  CHAT_MODEL,
  CHAT_MODEL_FALLBACK,
  CHAT_RATE_LIMIT,
  CHAT_RATE_WINDOW_MS,
  CHAT_SYSTEM_PROMPT,
  CHAT_TEMPERATURE,
  CHAT_TIMEOUT_MS,
} from '@/lib/config';

export const runtime = 'nodejs';
export const dynamic = 'force-dynamic';
export const maxDuration = 30;

type ChatMessage = { role: 'user' | 'assistant'; content: string };

type RateEntry = { count: number; resetAt: number };

const rateMap = new Map<string, RateEntry>();

function getIp(request: Request): string {
  const forwarded = request.headers.get('x-forwarded-for');
  if (forwarded) return forwarded.split(',')[0]?.trim() || 'unknown';
  return request.headers.get('x-real-ip') || 'unknown';
}

function cekRateLimit(ip: string): boolean {
  const now = Date.now();

  if (rateMap.size > 1000) {
    for (const [key, entry] of rateMap) {
      if (now >= entry.resetAt) rateMap.delete(key);
    }
  }

  const entry = rateMap.get(ip);
  if (!entry || now >= entry.resetAt) {
    rateMap.set(ip, { count: 1, resetAt: now + CHAT_RATE_WINDOW_MS });
    return true;
  }
  if (entry.count >= CHAT_RATE_LIMIT) return false;
  entry.count += 1;
  return true;
}

function bersihkanPesan(input: unknown): ChatMessage[] {
  if (!Array.isArray(input)) return [];

  const hasil: ChatMessage[] = [];
  for (const item of input) {
    if (!item || typeof item !== 'object') continue;
    const rec = item as Record<string, unknown>;
    const role = rec.role;
    const content = rec.content;

    if (
      (role === 'user' || role === 'assistant') &&
      typeof content === 'string'
    ) {
      const trimmed = content.trim().slice(0, CHAT_MAX_INPUT_CHARS);
      if (trimmed) hasil.push({ role, content: trimmed });
    }
  }

  return hasil.slice(-CHAT_MAX_HISTORY);
}

function buatKonteks(input: unknown): string {
  if (!input || typeof input !== 'object') return '';
  const rec = input as Record<string, unknown>;
  const bagian: string[] = [];

  if (typeof rec.targetProdi === 'string' && rec.targetProdi.trim()) {
    bagian.push(`Target prodi: ${rec.targetProdi.trim().slice(0, 120)}`);
  }
  if (typeof rec.kelas === 'string' && rec.kelas.trim()) {
    bagian.push(`Kelas: ${rec.kelas.trim().slice(0, 30)}`);
  }

  return bagian.length > 0
    ? `\n\nKonteks siswa (jangan minta data pribadi tambahan): ${bagian.join(
        '; '
      )}.`
    : '';
}

export async function POST(request: Request) {
  const apiKey = process.env.GROQ_API_KEY;
  if (!apiKey) {
    return NextResponse.json(
      {
        error:
          'Chat belum aktif. Admin perlu mengatur GROQ_API_KEY di Environment Variables.',
      },
      { status: 503 }
    );
  }

  const ip = getIp(request);
  if (!cekRateLimit(ip)) {
    return NextResponse.json(
      {
        error:
          'Terlalu banyak pesan dalam waktu singkat. Istirahat sebentar, lalu coba lagi ya.',
      },
      { status: 429 }
    );
  }

  let body: unknown;
  try {
    body = await request.json();
  } catch {
    return NextResponse.json(
      { error: 'Format permintaan tidak valid.' },
      { status: 400 }
    );
  }

  const payload = body as { messages?: unknown; konteks?: unknown };
  const pesan = bersihkanPesan(payload?.messages);

  if (pesan.length === 0) {
    return NextResponse.json(
      { error: 'Pesan tidak boleh kosong.' },
      { status: 400 }
    );
  }
  if (pesan[pesan.length - 1]?.role !== 'user') {
    return NextResponse.json(
      { error: 'Pesan terakhir harus dari siswa.' },
      { status: 400 }
    );
  }

  const konteks = buatKonteks(payload?.konteks);
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), CHAT_TIMEOUT_MS);

  const panggilGroq = (model: string) =>
    fetch('https://api.groq.com/openai/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${apiKey}`,
      },
      body: JSON.stringify({
        model,
        temperature: CHAT_TEMPERATURE,
        max_tokens: CHAT_MAX_TOKENS,
        messages: [
          { role: 'system', content: CHAT_SYSTEM_PROMPT + konteks },
          ...pesan,
        ],
      }),
      signal: controller.signal,
    });

  try {
    let response = await panggilGroq(CHAT_MODEL);

    // Kalau model utama sudah tidak tersedia di Groq, coba model cadangan.
    if (response.status === 404) {
      response = await panggilGroq(CHAT_MODEL_FALLBACK);
    }

    if (!response.ok) {
      if (response.status === 401 || response.status === 403) {
        return NextResponse.json(
          {
            error:
              'API key Groq tidak valid. Periksa GROQ_API_KEY di Environment Variables.',
          },
          { status: 503 }
        );
      }
      if (response.status === 429) {
        return NextResponse.json(
          {
            error:
              'Kuota chat sedang penuh. Coba lagi beberapa saat lagi, ya.',
          },
          { status: 429 }
        );
      }
      return NextResponse.json(
        {
          error:
            'Layanan chat sedang bermasalah. Coba lagi beberapa saat lagi.',
        },
        { status: 502 }
      );
    }

    const json: any = await response.json();
    const reply = json?.choices?.[0]?.message?.content;

    if (typeof reply !== 'string' || !reply.trim()) {
      return NextResponse.json(
        { error: 'Layanan chat tidak mengirim balasan. Coba lagi, ya.' },
        { status: 502 }
      );
    }

    return NextResponse.json({ reply: reply.trim() });
  } catch (err: any) {
    if (err?.name === 'AbortError') {
      return NextResponse.json(
        { error: 'Balasan terlalu lama. Coba kirim ulang pesanmu, ya.' },
        { status: 504 }
      );
    }
    return NextResponse.json(
      {
        error:
          'Tidak bisa menghubungi layanan chat. Periksa koneksi internet lalu coba lagi.',
      },
      { status: 502 }
    );
  } finally {
    clearTimeout(timeout);
  }
}
