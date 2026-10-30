// Menulis supabase/seed.sql dari data di scripts/seed-data.mjs
// Jalankan: npm run seed:sql
// Untuk database yang sudah ada, lebih mudah: npm run seed

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
-- Untuk database yang sudah ada, gunakan: npm run seed
-- Angka daya tampung, peminat, dan median adalah estimasi wajar,
-- bukan angka resmi SNPMB. Ganti dengan data resmi bila tersedia.
-- ================================================================

begin;

insert into public.ptn (kode, nama, singkatan)
select v.kode, v.nama, v.singkatan
from (values
`;

sql += PTN.map(
  (p) =>
    `  ('${esc(p.singkatan)}', '${esc(p.nama)}', '${esc(p.singkatan)}')`
).join(',\n');

sql += `
) as v(kode, nama, singkatan)
where not exists (
  select 1 from public.ptn p where p.singkatan = v.singkatan
);

`;

for (const ptn of PTN) {
  const list = byPtn.get(ptn.singkatan) || [];
  if (list.length === 0) continue;

  sql += `-- ${ptn.singkatan} (${list.length} prodi)\n`;
  sql += `insert into public.prodi (
  ptn_id, nama, rumpun, jenjang, mapel_pendukung, butuh_portofolio,
  daya_tampung_snbp, daya_tampung_snbt,
  peminat_snbp_historis, peminat_snbt_historis,
  bobot_snbp, bobot_snbt
)
select
  p.id, v.nama, v.rumpun, v.jenjang, v.mapel, v.butuh,
  v.dsnbp, v.dsnbt, v.psnbp, v.psnbt,
  v.bobot, v.bobot_snbt
from public.ptn p
cross join (values
`;

  sql += list
    .map(
      (r) =>
        `  ('${esc(r.nama)}', '${esc(r.rumpun)}', '${esc(
          r.jenjang
        )}', ${sqlArray(r.mapel)}, ${r.butuhPortofolio}, ${r.dsnbp}, ${
          r.dsnbt
        }, ${sqlArray(r.psnbp)}, ${sqlArray(r.psnbt)}, ${sqlJson(
          r.bobot
        )}, ${sqlJson(r.bobotSnbt)})`
    )
    .join(',\n');

  sql += `
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = '${ptn.singkatan}'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

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
