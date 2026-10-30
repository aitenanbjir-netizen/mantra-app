// Mengisi Supabase dengan 50 PTN + 500 prodi.
// Prasyarat: supabase/schema.sql sudah dijalankan di SQL Editor.
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

  const cek = await request('ptn?select=singkatan&limit=1');
  if (!cek.response.ok) {
    throw new Error(
      `Tabel public.ptn belum bisa diakses (HTTP ${cek.response.status}). ` +
        'Jalankan supabase/schema.sql dulu di Supabase SQL Editor.'
    );
  }

  console.log('1/3 Upsert daftar PTN...');
  const ptnPayload = PTN.map((p) => ({
    nama: p.nama,
    singkatan: p.singkatan,
    kota: p.kota,
  }));

  const upsertPtn = await request('ptn?on_conflict=singkatan', {
    method: 'POST',
    headers: {
      Prefer: 'resolution=merge-duplicates,return=minimal',
    },
    body: JSON.stringify(ptnPayload),
  });
  if (!upsertPtn.response.ok) {
    throw new Error(
      `Gagal menyimpan PTN (HTTP ${upsertPtn.response.status}): ${upsertPtn.text}`
    );
  }

  console.log('2/3 Ambil ID PTN...');
  const ptnRes = await request('ptn?select=id,singkatan&limit=1000');
  if (!ptnRes.response.ok) {
    throw new Error(`Gagal membaca PTN: ${ptnRes.text}`);
  }
  const ptnList = Array.isArray(ptnRes.json) ? ptnRes.json : [];
  const idPtn = new Map(
    ptnList.map((p) => [p.singkatan, p.id])
  );

  const rows = buildProdiRows();
  const belumAda = [...new Set(rows.map((r) => r.singkatan))].filter(
    (s) => !idPtn.has(s)
  );
  if (belumAda.length > 0) {
    throw new Error(`PTN belum tersimpan: ${belumAda.join(', ')}`);
  }

  console.log(`3/3 Insert ${rows.length} prodi...`);
  const payload = rows.map((r) => ({
    ptn_id: idPtn.get(r.singkatan),
    nama: r.nama,
    rumpun: r.rumpun,
    mapel_pendukung: r.mapel,
    daya_tampung_snbp: r.dsnbp,
    daya_tampung_snbt: r.dsnbt,
    peminat_snbp_historis: r.psnbp,
    peminat_snbt_historis: r.psnbt,
    bobot_snbp: r.bobot,
    median_snbp: r.medsnbp,
    median_snbt: r.medsnbt,
  }));

  const BATCH = 100;
  for (let i = 0; i < payload.length; i += BATCH) {
    const batch = payload.slice(i, i + BATCH);
    const res = await request('prodi?on_conflict=ptn_id,nama', {
      method: 'POST',
      headers: {
        Prefer: 'resolution=ignore-duplicates,return=minimal',
      },
      body: JSON.stringify(batch),
    });
    if (!res.response.ok) {
      throw new Error(
        `Gagal insert prodi batch ${i / BATCH + 1} ` +
          `(HTTP ${res.response.status}): ${res.text}`
      );
    }
    console.log(`   ${Math.min(i + BATCH, payload.length)}/${payload.length}`);
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
