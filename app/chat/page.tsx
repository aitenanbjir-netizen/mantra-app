'use client';

import { useEffect, useRef, useState } from 'react';
import { Button } from '@/components/ui/button';
import { Textarea } from '@/components/ui/textarea';
import {
  CHAT_GREETING,
  CHAT_MAX_HISTORY,
  CHAT_MAX_INPUT_CHARS,
  CHAT_QUICK_PROMPTS,
  CRISIS_TEXT,
} from '@/lib/config';

type Msg = {
  id: string;
  role: 'user' | 'assistant';
  content: string;
};

type SiswaCache = {
  nama?: string;
  kelas?: string;
  target_prodi?: string;
};

function buatId(): string {
  return `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;
}

export default function ChatPage() {
  const [messages, setMessages] = useState<Msg[]>([]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(false);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState('');
  const [siswa, setSiswa] = useState<SiswaCache | null>(null);

  const bottomRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const cachedSiswa = localStorage.getItem('mantra_siswa');
    if (cachedSiswa) {
      try {
        setSiswa(JSON.parse(cachedSiswa));
      } catch {
        // abaikan cache yang rusak
      }
    }

    const cachedChat = localStorage.getItem('mantra_chat');
    if (cachedChat) {
      try {
        const parsed = JSON.parse(cachedChat);
        if (Array.isArray(parsed) && parsed.length > 0) {
          setMessages(parsed);
          setLoaded(true);
          return;
        }
      } catch {
        // abaikan cache yang rusak
      }
    }

    setMessages([
      { id: 'greeting', role: 'assistant', content: CHAT_GREETING },
    ]);
    setLoaded(true);
  }, []);

  useEffect(() => {
    if (!loaded) return;
    localStorage.setItem(
      'mantra_chat',
      JSON.stringify(messages.slice(-50))
    );
  }, [messages, loaded]);

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: 'smooth', block: 'end' });
  }, [messages, loading]);

  function hapusChat() {
    if (!window.confirm('Hapus seluruh percakapan ini?')) return;
    setMessages([
      { id: 'greeting', role: 'assistant', content: CHAT_GREETING },
    ]);
    setError('');
  }

  async function kirim(teks?: string) {
    const isi = (teks ?? input).trim();
    if (!isi || loading) return;

    setError('');
    const pesanSiswa: Msg = {
      id: buatId(),
      role: 'user',
      content: isi.slice(0, CHAT_MAX_INPUT_CHARS),
    };
    const next = [...messages, pesanSiswa];
    setMessages(next);
    setInput('');
    setLoading(true);

    try {
      const res = await fetch('/api/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          messages: next
            .slice(-CHAT_MAX_HISTORY)
            .map((m) => ({ role: m.role, content: m.content })),
          konteks: {
            targetProdi: siswa?.target_prodi,
            kelas: siswa?.kelas,
          },
        }),
      });

      const data = await res.json().catch(() => ({}));
      if (!res.ok) {
        throw new Error(
          data?.error || 'Server chat sedang tidak bisa dihubungi.'
        );
      }

      const reply = typeof data?.reply === 'string' ? data.reply : '';
      if (!reply.trim()) {
        throw new Error('Balasan kosong. Coba kirim ulang pesanmu, ya.');
      }

      setMessages([
        ...next,
        { id: buatId(), role: 'assistant', content: reply.trim() },
      ]);
    } catch (err: any) {
      setError(
        err?.message ||
          'Gagal mengirim pesan. Periksa koneksi lalu coba lagi.'
      );
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="space-y-4">
      <div className="bg-gradient-to-br from-primary/20 via-card to-card border border-primary/20 rounded-2xl p-4">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-full bg-primary/20 flex items-center justify-center text-xl shrink-0">
            🌸
          </div>
          <div className="min-w-0">
            <h1 className="font-bold leading-tight">MANTRA Care</h1>
            <p className="text-[10px] text-muted-foreground flex items-center gap-1">
              <span className="inline-block w-1.5 h-1.5 rounded-full bg-emerald-400" />
              Pendamping kesehatan mental · SNBP/SNBT
            </p>
          </div>
          <button
            onClick={hapusChat}
            className="ml-auto text-[10px] text-muted-foreground hover:text-foreground border border-border rounded-lg px-2 py-1 shrink-0"
          >
            Bersihkan
          </button>
        </div>
        <p className="text-[10px] text-muted-foreground mt-3 leading-relaxed">
          Aku teman cerita, bukan pengganti psikolog atau guru BK. Kalau
          kondisimu berat, tolong hubungi orang dewasa terdekat.
        </p>
      </div>

      <div className="space-y-3 min-h-[30vh]">
        {messages.map((m) => (
          <div
            key={m.id}
            className={`flex items-end gap-2 ${
              m.role === 'user' ? 'justify-end' : 'justify-start'
            }`}
          >
            {m.role === 'assistant' && (
              <div className="w-7 h-7 rounded-full bg-primary/15 flex items-center justify-center text-sm shrink-0 mb-0.5">
                🌸
              </div>
            )}
            <div
              className={`max-w-[85%] rounded-2xl px-3.5 py-2.5 text-sm leading-relaxed whitespace-pre-wrap ${
                m.role === 'user'
                  ? 'bg-primary text-primary-foreground rounded-br-md'
                  : 'bg-card border border-border rounded-bl-md'
              }`}
            >
              {m.content}
            </div>
          </div>
        ))}

        {loading && (
          <div className="flex items-end gap-2 justify-start">
            <div className="w-7 h-7 rounded-full bg-primary/15 flex items-center justify-center text-sm shrink-0">
              🌸
            </div>
            <div className="bg-card border border-border rounded-2xl rounded-bl-md px-4 py-3">
              <div className="flex gap-1">
                <span className="w-1.5 h-1.5 rounded-full bg-muted-foreground animate-bounce [animation-delay:-0.3s]" />
                <span className="w-1.5 h-1.5 rounded-full bg-muted-foreground animate-bounce [animation-delay:-0.15s]" />
                <span className="w-1.5 h-1.5 rounded-full bg-muted-foreground animate-bounce" />
              </div>
            </div>
          </div>
        )}

        <div ref={bottomRef} />
      </div>

      {messages.length <= 1 && !loading && (
        <div className="space-y-2">
          <p className="text-[10px] text-muted-foreground font-semibold">
            MULAI DARI SINI
          </p>
          {CHAT_QUICK_PROMPTS.map((prompt) => (
            <button
              key={prompt}
              onClick={() => kirim(prompt)}
              className="w-full text-left text-xs bg-card border border-border rounded-xl px-3 py-2.5 hover:border-primary/40 hover:bg-primary/5 transition"
            >
              {prompt}
            </button>
          ))}
        </div>
      )}

      {error && (
        <div className="bg-red-900/20 border border-red-500/30 rounded-xl p-3 text-sm text-red-300">
          ❌ {error}
        </div>
      )}

      <div className="bg-yellow-900/20 border border-yellow-500/30 rounded-xl p-3 text-[10px] text-yellow-200/90 leading-relaxed">
        🆘 {CRISIS_TEXT}
      </div>

      <div className="sticky bottom-2 bg-background/95 backdrop-blur pt-2">
        <div className="flex items-end gap-2 bg-card border border-border rounded-2xl p-2">
          <Textarea
            value={input}
            onChange={(e) =>
              setInput(e.target.value.slice(0, CHAT_MAX_INPUT_CHARS))
            }
            onKeyDown={(e) => {
              if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                kirim();
              }
            }}
            rows={1}
            placeholder="Cerita aja... (Enter untuk kirim)"
            className="min-h-[42px] max-h-32 resize-none border-0 bg-transparent focus-visible:ring-0 text-sm"
          />
          <Button
            onClick={() => kirim()}
            disabled={loading || !input.trim()}
            className="bg-primary hover:bg-primary/90 h-10 px-3 shrink-0"
          >
            ➤
          </Button>
        </div>
        <p className="text-[9px] text-muted-foreground text-center mt-1.5">
          MANTRA Care bisa salah. Untuk keputusan penting, tetap konsultasi
          dengan guru BK/orang tua.
        </p>
      </div>
    </div>
  );
}
