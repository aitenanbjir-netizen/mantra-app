// Menulis supabase/seed.sql dari data di scripts/seed-data.mjs
// Jalankan: npm run seed:sql

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { PTN, buildProdiRows } from './seed-data.mjs';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, '..');

function esc(value) {
  return String(value).replace(/'/g, "''");
}

function sqlArray(values) {
  const items = values.map((v) =>
    typeof v === 'number' ? String(v) : `'${esc(v)}'`
  );
  return `array[${items.join(',')}]`;
}

function sqlJson(value) {
  return `'${JSON.stringify(value)}'::jsonb`;
}

const rows = buildProdiRows();
if (rows.length !== 500) {
  throw new Error(`Target 500 prodi, tapi terbentuk ${rows.length}.`);
}

const byPtn = new Map();
for (const row of rows) {
  if (!byPtn.has(row.singkatan)) byPtn.set(row.singkatan, []);
  byPtn.get(row.singkatan).push(row);
}

let sql = `-- ================================================================
-- MANTRA — SEED 500 PRODI (AUTO-GENERATED)
-- Jalankan SETELAH supabase/schema.sql di SQL Editor.
-- Angka daya tampung, peminat, dan median adalah estimasi wajar,
-- bukan angka resmi SNPMB. Ganti dengan data resmi bila tersedia.
-- ================================================================

begin;

insert into public.ptn (nama, singkatan, kota) values
`;

sql += PTN.map(
  (p) => `  ('${esc(p.nama)}', '${p.singkatan}', '${esc(p.kota)}')`
).join(',\n');

sql += `
on conflict (singkatan) do update
set nama = excluded.nama, kota = excluded.kota;

`;

for (const ptn of PTN) {
  const list = byPtn.get(ptn.singkatan) || [];
  if (list.length === 0) continue;

  sql += `-- ${ptn.singkatan} (${list.length} prodi)\n`;
  sql += `insert into public.prodi (
  ptn_id, nama, rumpun, mapel_pendukung,
  daya_tampung_snbp, daya_tampung_snbt,
  peminat_snbp_historis, peminat_snbt_historis,
  bobot_snbp, median_snbp, median_snbt
)
select
  p.id, v.nama, v.rumpun, v.mapel,
  v.dsnbp, v.dsnbt, v.psnbp, v.psnbt,
  v.bobot, v.medsnbp, v.medsnbt
from public.ptn p
cross join (values
`;

  sql += list
    .map(
      (r) =>
        `  ('${esc(r.nama)}', '${esc(r.rumpun)}', ${sqlArray(
          r.mapel
        )}, ${r.dsnbp}, ${r.dsnbt}, ${sqlArray(r.psnbp)}, ${sqlArray(
          r.psnbt
        )}, ${sqlJson(r.bobot)}, ${r.medsnbp}, ${r.medsnbt})`
    )
    .join(',\n');

  sql += `
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = '${ptn.singkatan}'
on conflict (ptn_id, nama) do nothing;

`;
}

sql += `commit;

-- Cek hasil:
-- select count(*) as total_prodi from public.prodi;
-- select count(*) as total_ptn from public.ptn;
`;

const outPath = path.join(root, 'supabase', 'seed.sql');
fs.writeFileSync(outPath, sql, 'utf8');
console.log(`OK: ${rows.length} prodi dari ${PTN.length} PTN -> ${outPath}`);
