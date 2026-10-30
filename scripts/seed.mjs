// Mengisi Supabase dengan 50 PTN + 500 prodi.
// Skrip ini menyesuaikan diri dengan schema MANTRA yang sudah ada:
// - ptn: kode, nama, singkatan
// - prodi: rumpun, jenjang, butuh_portofolio, bobot_snbp, bobot_snbt
// Jalankan: npm run seed

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { PTN, buildProdiRows } from './seed-data.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');

function bacaEnv() {
  const envPath = path.join(root, '.env.local');
  if (!fs.existsSync(envPath)) {
    throw new Error(
      'File .env.local tidak ditemukan. Buat dulu dari .env.example.'
    );
  }

  const env = {};
  for (const line of fs.readFileSync(envPath, 'utf8').split(/\r?\n/)) {
    const match = line.match(/^\s*([A-Za-z_][A-Za-z0-9_]*)\s*=\s*(.*)\s*$/);
    if (match) {
      env[match[1]] = match[2].replace(/^["']|["']$/g, '');
    }
  }
  return env;
}

const env = bacaEnv();
const url = env.NEXT_PUBLIC_SUPABASE_URL;
const key = env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!url || !key) {
  throw new Error(
    'NEXT_PUBLIC_SUPABASE_URL / NEXT_PUBLIC_SUPABASE_ANON_KEY belum ada di .env.local.'
  );
}

const headers = {
  apikey: key,
  Authorization: `Bearer ${key}`,
  'Content-Type': 'application/json',
};

async function request(pathname, options = {}) {
  const response = await fetch(`${url}/rest/v1/${pathname}`, {
    ...options,
    headers: { ...headers, ...(options.headers || {}) },
  });
  const text = await response.text();
  let json = null;
  try {
    json = text ? JSON.parse(text) : null;
  } catch {
    // biarkan null kalau respons bukan JSON
  }
  return { response, text, json };
}

async function main() {
  console.log('MANTRA seed — 50 PTN, 500 prodi');
  console.log(`Target: ${url}`);

  const cek = await request('ptn?select=id,singkatan,nama&limit=200');
  if (!cek.response.ok) {
    throw new Error(
      `Tabel public.ptn belum bisa diakses (HTTP ${cek.response.status}). ` +
        'Pastikan project Supabase aktif dan RLS sudah dimatikan untuk development.'
    );
  }

  const existingPtn = new Map(
    (Array.isArray(cek.json) ? cek.json : []).map((p) => [p.singkatan, p])
  );

  const missingPtn = PTN.filter((p) => !existingPtn.has(p.singkatan));

  if (missingPtn.length > 0) {
    console.log(`1/3 Tambah ${missingPtn.length} PTN baru...`);
    const res = await request('ptn', {
      method: 'POST',
      headers: { Prefer: 'return=minimal' },
      body: JSON.stringify(
        missingPtn.map((p) => ({
          kode: p.singkatan,
          nama: p.nama,
          singkatan: p.singkatan,
        }))
      ),
    });
    if (!res.response.ok) {
      throw new Error(
        `Gagal menyimpan PTN (HTTP ${res.response.status}): ${res.text}`
      );
    }
  } else {
    console.log('1/3 Semua PTN sudah ada.');
  }

  console.log('2/3 Ambil ID PTN...');
  const ptnRes = await request('ptn?select=id,singkatan&limit=500');
  if (!ptnRes.response.ok) {
    throw new Error(`Gagal membaca PTN: ${ptnRes.text}`);
  }
  const idPtn = new Map(
    (Array.isArray(ptnRes.json) ? ptnRes.json : []).map((p) => [
      p.singkatan,
      p.id,
    ])
  );

  const rows = buildProdiRows();
  const belumAdaPtn = [...new Set(rows.map((r) => r.singkatan))].filter(
    (s) => !idPtn.has(s)
  );
  if (belumAdaPtn.length > 0) {
    throw new Error(`PTN belum tersimpan: ${belumAdaPtn.join(', ')}`);
  }

  const prodiRes = await request('prodi?select=ptn_id,nama&limit=2000');
  if (!prodiRes.response.ok) {
    throw new Error(`Gagal membaca daftar prodi: ${prodiRes.text}`);
  }
  const existingProdi = new Set(
    (Array.isArray(prodiRes.json) ? prodiRes.json : []).map(
      (p) => `${p.ptn_id}::${p.nama}`
    )
  );

  const payload = rows
    .map((r) => {
      const ptnId = idPtn.get(r.singkatan);
      return {
        ptn_id: ptnId,
        nama: r.nama,
        rumpun: r.rumpun,
        jenjang: r.jenjang,
        mapel_pendukung: r.mapel,
        butuh_portofolio: r.butuhPortofolio,
        daya_tampung_snbp: r.dsnbp,
        daya_tampung_snbt: r.dsnbt,
        peminat_snbp_historis: r.psnbp,
        peminat_snbt_historis: r.psnbt,
        bobot_snbp: r.bobot,
        bobot_snbt: r.bobotSnbt,
      };
    })
    .filter((r) => !existingProdi.has(`${r.ptn_id}::${r.nama}`));

  console.log(
    `3/3 Insert ${payload.length} prodi baru ` +
      `(${existingProdi.size} sudah ada, total target ${rows.length})...`
  );

  const BATCH = 80;
  let inserted = 0;
  for (let i = 0; i < payload.length; i += BATCH) {
    const batch = payload.slice(i, i + BATCH);
    const res = await request('prodi', {
      method: 'POST',
      headers: { Prefer: 'return=minimal' },
      body: JSON.stringify(batch),
    });
    if (!res.response.ok) {
      throw new Error(
        `Gagal insert prodi batch ${i / BATCH + 1} ` +
          `(HTTP ${res.response.status}): ${res.text}`
      );
    }
    inserted += batch.length;
    console.log(`   ${inserted}/${payload.length}`);
  }

  const head = await fetch(`${url}/rest/v1/prodi?select=id`, {
    method: 'HEAD',
    headers: { ...headers, Prefer: 'count=exact', Range: '0-0' },
  });
  const contentRange = head.headers.get('content-range') || '';
  const total = contentRange.split('/')[1] || '?';

  console.log('');
  console.log(`Selesai. Total prodi di database: ${total}`);
  console.log('Buka app, cari prodi di halaman Data Diri / SNBT.');
}

main().catch((err) => {
  console.error('');
  console.error('GAGAL:', err.message);
  process.exitCode = 1;
});
