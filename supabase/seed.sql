-- ================================================================
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
  ('UI', 'Universitas Indonesia', 'UI'),
  ('ITB', 'Institut Teknologi Bandung', 'ITB'),
  ('UGM', 'Universitas Gadjah Mada', 'UGM'),
  ('IPB', 'Institut Pertanian Bogor', 'IPB'),
  ('ITS', 'Institut Teknologi Sepuluh Nopember', 'ITS'),
  ('UNDIP', 'Universitas Diponegoro', 'UNDIP'),
  ('UB', 'Universitas Brawijaya', 'UB'),
  ('UNPAD', 'Universitas Padjadjaran', 'UNPAD'),
  ('UNHAS', 'Universitas Hasanuddin', 'UNHAS'),
  ('UNAIR', 'Universitas Airlangga', 'UNAIR'),
  ('UNAND', 'Universitas Andalas', 'UNAND'),
  ('UNNES', 'Universitas Negeri Semarang', 'UNNES'),
  ('UNY', 'Universitas Negeri Yogyakarta', 'UNY'),
  ('UNS', 'Universitas Sebelas Maret', 'UNS'),
  ('UPI', 'Universitas Pendidikan Indonesia', 'UPI'),
  ('UNM', 'Universitas Negeri Malang', 'UNM'),
  ('UNUD', 'Universitas Udayana', 'UNUD'),
  ('UNRAM', 'Universitas Mataram', 'UNRAM'),
  ('UNDIKSHA', 'Universitas Pendidikan Ganesha', 'UNDIKSHA'),
  ('UNIMA', 'Universitas Negeri Manado', 'UNIMA'),
  ('UNG', 'Universitas Negeri Gorontalo', 'UNG'),
  ('UNTAD', 'Universitas Tadulako', 'UNTAD'),
  ('UNTAN', 'Universitas Tanjungpura', 'UNTAN'),
  ('ULM', 'Universitas Lambung Mangkurat', 'ULM'),
  ('UNJ', 'Universitas Negeri Jakarta', 'UNJ'),
  ('UNILA', 'Universitas Lampung', 'UNILA'),
  ('UNIB', 'Universitas Bengkulu', 'UNIB'),
  ('UNJA', 'Universitas Jambi', 'UNJA'),
  ('UNRI', 'Universitas Riau', 'UNRI'),
  ('UNSRI', 'Universitas Sriwijaya', 'UNSRI'),
  ('UBB', 'Universitas Bangka Belitung', 'UBB'),
  ('UNTIRTA', 'Universitas Sultan Ageng Tirtayasa', 'UNTIRTA'),
  ('UNSOED', 'Universitas Jenderal Soedirman', 'UNSOED'),
  ('UNEJ', 'Universitas Jember', 'UNEJ'),
  ('UNSYIAH', 'Universitas Syiah Kuala', 'UNSYIAH'),
  ('UNIMED', 'Universitas Negeri Medan', 'UNIMED'),
  ('USU', 'Universitas Sumatera Utara', 'USU'),
  ('UNP', 'Universitas Negeri Padang', 'UNP'),
  ('UNTIDAR', 'Universitas Tidar', 'UNTIDAR'),
  ('UHO', 'Universitas Halu Oleo', 'UHO'),
  ('UNPATTI', 'Universitas Pattimura', 'UNPATTI'),
  ('UNCEN', 'Universitas Cenderawasih', 'UNCEN'),
  ('ITERA', 'Institut Teknologi Sumatera', 'ITERA'),
  ('ITK', 'Institut Teknologi Kalimantan', 'ITK'),
  ('PNJ', 'Politeknik Negeri Jakarta', 'PNJ'),
  ('POLBAN', 'Politeknik Negeri Bandung', 'POLBAN'),
  ('POLINES', 'Politeknik Negeri Semarang', 'POLINES'),
  ('PENS', 'Politeknik Elektronika Negeri Surabaya', 'PENS'),
  ('POLINEMA', 'Politeknik Negeri Malang', 'POLINEMA'),
  ('UPR', 'Universitas Palangka Raya', 'UPR')
) as v(kode, nama, singkatan)
where not exists (
  select 1 from public.ptn p where p.singkatan = v.singkatan
);

-- UI (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 65, 96, array[1031,1098,1215], array[1829,1978,2191], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 65, 77, array[918,969,1030], array[1411,1545,1562], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":696}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 87, 103, array[1202,1279,1351], array[1735,1848,1955], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 73, 87, array[1052,1110,1200], array[1676,1783,1802], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 92, 105, array[1269,1344,1508], array[2024,2002,2240], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":682}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 91, 111, array[1265,1334,1384], array[2194,2238,2450], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 77, 93, array[1012,1060,1079], array[1384,1526,1563], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 73, 90, array[902,976,1007], array[1476,1494,1549], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 61, 93, array[785,874,910], array[1379,1531,1577], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 81, 116, array[1042,1151,1177], array[1421,1526,1593], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":682}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UI'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- ITB (10 prodi)
insert into public.prodi (
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
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 52, 79, array[713,749,816], array[1045,1179,1225], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":690}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 67, 90, array[896,952,983], array[1212,1241,1331], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 72, 111, array[928,944,1008], array[1325,1437,1494], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 68, 107, array[1034,1111,1222], array[1363,1458,1571], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":702}'::jsonb),
  ('Sistem Informasi', 'saintek', 'S1', array['Matematika','Fisika'], false, 61, 95, array[957,988,1069], array[1537,1564,1666], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 52, 76, array[658,711,737], array[1152,1225,1268], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Teknik Material', 'saintek', 'S1', array['Fisika','Kimia'], false, 73, 93, array[908,1027,1071], array[1257,1341,1395], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":651}'::jsonb),
  ('Teknik Pertambangan', 'saintek', 'S1', array['Matematika','Fisika'], false, 77, 86, array[948,1020,1108], array[1740,1750,1944], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":655}'::jsonb),
  ('Teknik Geodesi', 'saintek', 'S1', array['Matematika','Fisika'], false, 64, 98, array[744,793,849], array[1213,1382,1405], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":637}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 51, 90, array[608,651,687], array[1114,1175,1208], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'ITB'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UGM (10 prodi)
insert into public.prodi (
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
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 53, 79, array[677,729,813], array[1068,1227,1209], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 70, 87, array[1114,1176,1265], array[1902,2036,2215], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":705}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 61, 71, array[894,964,1013], array[1511,1568,1597], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 84, 95, array[1168,1261,1356], array[1776,1940,2019], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":699}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 85, 103, array[1130,1154,1296], array[1754,1779,1928], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":690}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 85, 101, array[1178,1257,1292], array[2025,2138,2270], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":695}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 60, 96, array[810,874,933], array[1009,1134,1170], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 43, 53, array[654,688,729], array[969,1005,1109], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Statistika', 'saintek', 'S1', array['Matematika'], false, 80, 92, array[965,1093,1171], array[1491,1509,1653], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":653}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 67, 91, array[951,1049,1064], array[1351,1427,1477], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UGM'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- IPB (10 prodi)
insert into public.prodi (
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
  ('Agroteknologi', 'saintek', 'S1', array['Biologi','Kimia'], false, 87, 104, array[1090,1219,1301], array[1552,1663,1738], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Peternakan', 'saintek', 'S1', array['Biologi','Kimia'], false, 78, 99, array[1009,1090,1195], array[1460,1538,1689], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Teknologi Pangan', 'saintek', 'S1', array['Biologi','Kimia'], false, 90, 103, array[1128,1176,1326], array[1946,2111,2294], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":682}'::jsonb),
  ('Agribisnis', 'saintek', 'S1', array['Biologi','Ekonomi'], false, 62, 73, array[815,868,953], array[1383,1482,1565], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Kedokteran Hewan', 'saintek', 'S1', array['Biologi','Kimia'], false, 78, 99, array[1208,1231,1323], array[1925,1962,2032], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Teknologi Industri Pertanian', 'saintek', 'S1', array['Matematika','Fisika'], false, 57, 69, array[639,673,705], array[1004,1086,1167], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Kehutanan', 'saintek', 'S1', array['Biologi','Geografi'], false, 52, 65, array[666,711,769], array[937,1005,1047], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('Proteksi Tanaman', 'saintek', 'S1', array['Biologi','Kimia'], false, 76, 104, array[890,970,1033], array[1524,1578,1771], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":646}'::jsonb),
  ('Biologi', 'saintek', 'S1', array['Biologi','Kimia'], false, 42, 72, array[553,597,658], array[843,922,947], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":652}'::jsonb),
  ('Gizi', 'saintek', 'S1', array['Biologi','Kimia'], false, 85, 117, array[1152,1177,1320], array[1447,1601,1670], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'IPB'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- ITS (10 prodi)
insert into public.prodi (
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
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 50, 81, array[615,670,700], array[823,875,940], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 93, 105, array[1401,1425,1520], array[2391,2481,2686], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 95, 109, array[1441,1572,1611], array[2012,2122,2218], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 85, 96, array[1265,1398,1490], array[2368,2475,2651], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Sistem Informasi', 'saintek', 'S1', array['Matematika','Fisika'], false, 70, 105, array[998,1055,1098], array[1443,1540,1727], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":698}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 80, 102, array[940,1044,1110], array[1538,1675,1780], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Teknik Material', 'saintek', 'S1', array['Fisika','Kimia'], false, 45, 59, array[515,552,629], array[825,858,909], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":656}'::jsonb),
  ('Teknik Pertambangan', 'saintek', 'S1', array['Matematika','Fisika'], false, 50, 75, array[644,688,776], array[1066,1082,1156], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":654}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 54, 79, array[708,762,831], array[1019,1146,1194], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 85, 121, array[1272,1373,1430], array[1870,2043,2077], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'ITS'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNDIP (10 prodi)
insert into public.prodi (
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
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 48, 73, array[693,737,802], array[1117,1152,1224], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 99, 113, array[1549,1642,1805], array[2105,2201,2335], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 77, 109, array[1122,1148,1200], array[1500,1568,1685], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":696}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 52, 62, array[755,824,901], array[1205,1265,1339], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 83, 93, array[1124,1179,1232], array[1665,1734,1818], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":693}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 70, 94, array[929,1003,1082], array[1330,1344,1482], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 45, 67, array[595,648,695], array[988,1065,1136], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 91, 125, array[1187,1263,1380], array[1756,1881,1956], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 58, 68, array[739,812,846], array[1224,1316,1398], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 47, 63, array[583,618,692], array[765,835,883], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNDIP'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UB (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 87, 105, array[1153,1192,1326], array[2018,2084,2131], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 76, 111, array[1088,1138,1207], array[1877,1914,1988], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 65, 77, array[952,1011,1135], array[1713,1818,1941], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":690}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 44, 71, array[681,705,748], array[944,964,1029], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 45, 67, array[670,716,766], array[1148,1251,1322], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":696}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 57, 80, array[804,864,909], array[1016,1158,1219], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Statistika', 'saintek', 'S1', array['Matematika'], false, 50, 83, array[604,658,714], array[966,1047,1075], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":651}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 56, 86, array[704,772,779], array[1223,1311,1340], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":664}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 56, 88, array[813,857,918], array[1112,1197,1248], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 96, 132, array[1213,1281,1370], array[1671,1774,1907], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UB'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNPAD (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 68, 86, array[991,1016,1098], array[1350,1431,1450], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":697}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 55, 94, array[695,765,812], array[1036,1052,1118], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 95, 132, array[1429,1482,1618], array[2468,2503,2652], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":697}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 60, 99, array[848,909,1021], array[1601,1657,1745], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 82, 96, array[1094,1159,1272], array[1548,1620,1733], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":701}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 58, 95, array[885,930,983], array[1463,1491,1648], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":699}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 92, 127, array[1391,1489,1611], array[1903,2031,2026], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 46, 81, array[723,780,801], array[960,1036,1048], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":695}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 96, 122, array[1351,1502,1593], array[1771,1939,1985], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 70, 79, array[998,1050,1140], array[1538,1712,1725], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNPAD'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNHAS (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 64, 102, array[935,972,1048], array[1300,1322,1391], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 94, 103, array[1528,1619,1736], array[2407,2597,2744], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 85, 97, array[1280,1350,1470], array[2053,2105,2239], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 51, 65, array[798,839,938], array[1286,1365,1398], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 98, 132, array[1350,1365,1482], array[2113,2254,2247], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":699}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 59, 85, array[787,847,907], array[1122,1196,1255], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":697}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 70, 80, array[926,981,1028], array[1212,1278,1353], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 44, 72, array[575,612,649], array[973,1067,1080], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 81, 91, array[1037,1128,1223], array[1610,1692,1788], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 77, 90, array[1064,1142,1160], array[1749,1921,2102], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNHAS'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNAIR (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 99, 121, array[1500,1625,1700], array[2150,2305,2533], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 46, 67, array[602,654,708], array[806,853,923], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 97, 116, array[1299,1359,1481], array[2325,2520,2571], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":682}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 81, 113, array[1193,1238,1386], array[1721,1789,1830], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 61, 88, array[882,948,1033], array[1373,1529,1509], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 70, 84, array[1049,1109,1177], array[1431,1612,1678], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 60, 97, array[854,894,945], array[1275,1341,1435], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 85, 117, array[1189,1344,1405], array[2066,2183,2279], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":685}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 53, 65, array[795,880,906], array[1391,1492,1606], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":682}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 93, 105, array[1101,1214,1332], array[1714,1869,1941], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":664}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNAIR'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNAND (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 51, 60, array[696,727,779], array[1165,1274,1330], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 83, 108, array[1258,1383,1513], array[2213,2306,2425], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 65, 99, array[874,927,986], array[1394,1437,1536], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":702}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 49, 79, array[740,784,812], array[1123,1111,1235], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":694}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 58, 75, array[760,846,889], array[1274,1375,1422], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 50, 86, array[758,824,863], array[1268,1379,1439], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 54, 83, array[677,730,803], array[1000,1049,1079], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":661}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 59, 75, array[801,871,942], array[1102,1161,1181], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 98, 115, array[1274,1334,1453], array[2039,2071,2298], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":656}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 92, 110, array[1440,1477,1632], array[2319,2558,2712], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":697}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNAND'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNNES (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 53, 70, array[775,867,898], array[1198,1236,1319], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 85, 111, array[1195,1280,1403], array[1836,1944,2115], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 57, 69, array[817,871,917], array[1465,1508,1540], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 76, 86, array[943,978,1082], array[1362,1495,1536], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":654}'::jsonb),
  ('Pendidikan Fisika', 'saintek', 'S1', array['Fisika','Matematika'], false, 79, 99, array[897,943,1037], array[1265,1308,1410], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Pendidikan Geografi', 'soshum', 'S1', array['Geografi'], false, 57, 95, array[675,737,802], array[1053,1100,1238], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":636}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 54, 78, array[648,706,765], array[1219,1236,1337], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":655}'::jsonb),
  ('Pendidikan Sejarah', 'soshum', 'S1', array['Sejarah Indonesia'], false, 79, 96, array[1013,1014,1134], array[1569,1697,1841], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Pendidikan Anak Usia Dini', 'soshum', 'S1', array['Bahasa Indonesia'], false, 90, 126, array[1068,1126,1221], array[1631,1770,1885], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 78, 97, array[882,981,1017], array[1516,1557,1643], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNNES'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNY (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 74, 84, array[931,995,1069], array[1529,1555,1655], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 44, 67, array[535,574,611], array[855,966,972], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 66, 102, array[1020,1050,1130], array[1318,1416,1518], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":662}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 62, 77, array[801,827,857], array[1075,1135,1217], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":650}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 79, 95, array[1013,1066,1144], array[1512,1539,1712], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Pendidikan Anak Usia Dini', 'soshum', 'S1', array['Bahasa Indonesia'], false, 48, 67, array[525,573,626], array[723,771,865], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 73, 112, array[809,893,982], array[1200,1318,1351], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":645}'::jsonb),
  ('Pendidikan Fisika', 'saintek', 'S1', array['Fisika','Matematika'], false, 79, 104, array[997,1014,1116], array[1571,1628,1734], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":646}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 87, 99, array[1215,1322,1415], array[2007,2116,2264], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('Pendidikan Geografi', 'soshum', 'S1', array['Geografi'], false, 90, 105, array[1116,1148,1256], array[1965,2019,2135], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":636}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNY'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNS (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 88, 124, array[1182,1296,1331], array[1601,1781,1794], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":690}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 43, 72, array[588,625,681], array[1005,1118,1160], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 94, 115, array[1287,1358,1418], array[2008,2203,2394], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":705}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 93, 116, array[1325,1395,1463], array[2224,2402,2553], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 47, 67, array[591,633,667], array[881,902,992], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 49, 69, array[606,664,703], array[967,960,1069], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 42, 75, array[504,520,546], array[786,815,891], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 54, 69, array[702,750,808], array[886,966,1040], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":649}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 96, 130, array[1238,1346,1414], array[1806,1954,2056], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Sastra Inggris', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 72, 90, array[818,873,955], array[1149,1228,1323], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":655}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNS'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UPI (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 66, 88, array[859,959,1004], array[1235,1377,1394], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 46, 83, array[593,614,655], array[946,991,1035], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 80, 103, array[1013,1066,1211], array[1424,1479,1565], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 72, 89, array[897,960,1051], array[1502,1611,1742], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Pendidikan Biologi', 'saintek', 'S1', array['Biologi'], false, 70, 102, array[912,937,993], array[1636,1748,1811], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 48, 86, array[673,712,780], array[973,969,1042], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Pendidikan Anak Usia Dini', 'soshum', 'S1', array['Bahasa Indonesia'], false, 77, 104, array[850,934,1005], array[1240,1333,1502], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 90, 118, array[1025,1081,1173], array[1356,1396,1583], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":638}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 96, 114, array[1180,1255,1369], array[1533,1598,1655], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Pendidikan Geografi', 'soshum', 'S1', array['Geografi'], false, 45, 76, array[574,593,641], array[1020,1018,1143], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":642}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UPI'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNM (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 63, 98, array[884,914,1022], array[1203,1324,1347], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 98, 125, array[1285,1362,1449], array[2250,2448,2688], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 84, 96, array[1203,1298,1320], array[1775,1879,1985], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 74, 105, array[970,1030,1108], array[1468,1646,1720], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Pendidikan Ekonomi', 'soshum', 'S1', array['Ekonomi','Matematika'], false, 47, 57, array[577,612,642], array[912,964,1087], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":643}'::jsonb),
  ('Pendidikan Biologi', 'saintek', 'S1', array['Biologi'], false, 82, 122, array[924,944,1024], array[1392,1577,1639], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 56, 90, array[641,692,703], array[936,1026,1059], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Pendidikan Fisika', 'saintek', 'S1', array['Fisika','Matematika'], false, 65, 82, array[806,820,882], array[1458,1445,1624], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 52, 83, array[580,624,703], array[1088,1103,1236], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":650}'::jsonb),
  ('Pendidikan Geografi', 'soshum', 'S1', array['Geografi'], false, 91, 111, array[1037,1139,1212], array[1789,1873,1960], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":651}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNM'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNUD (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 60, 89, array[900,961,1004], array[1444,1514,1593], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 76, 112, array[1018,1074,1155], array[1554,1616,1779], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":694}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 73, 86, array[1068,1122,1223], array[1560,1735,1854], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":685}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 62, 85, array[859,916,1019], array[1577,1623,1761], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 68, 90, array[932,987,1090], array[1393,1417,1548], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":692}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 44, 71, array[598,635,672], array[928,999,1060], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":656}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 42, 57, array[552,574,612], array[815,874,928], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":651}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 58, 70, array[890,903,999], array[1478,1615,1721], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":693}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 67, 105, array[888,977,1033], array[1369,1440,1562], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":655}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 59, 96, array[657,702,786], array[1021,1112,1134], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNUD'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNRAM (10 prodi)
insert into public.prodi (
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
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 90, 99, array[1376,1440,1529], array[2351,2416,2696], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 75, 86, array[1190,1311,1410], array[2159,2290,2363], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 58, 80, array[846,908,1022], array[1166,1238,1314], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":702}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 64, 75, array[889,954,1039], array[1499,1543,1700], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 85, 105, array[1037,1106,1244], array[1466,1566,1556], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":664}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 49, 75, array[685,742,802], array[1151,1159,1286], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 50, 77, array[704,727,788], array[1090,1159,1277], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 85, 94, array[1064,1165,1236], array[1404,1536,1630], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Statistika', 'saintek', 'S1', array['Matematika'], false, 85, 107, array[946,1044,1091], array[1545,1636,1627], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 64, 82, array[748,807,838], array[1308,1337,1428], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":653}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNRAM'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNDIKSHA (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 94, 131, array[1258,1380,1457], array[1823,1948,2162], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 53, 64, array[767,782,839], array[1056,1142,1169], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 86, 117, array[1056,1113,1171], array[1843,1843,2051], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 54, 66, array[749,810,888], array[1053,1050,1111], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":652}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 89, 114, array[1049,1160,1258], array[1891,2021,2191], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Pendidikan Anak Usia Dini', 'soshum', 'S1', array['Bahasa Indonesia'], false, 45, 76, array[551,601,617], array[855,908,973], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 64, 93, array[883,923,951], array[1236,1356,1462], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":662}'::jsonb),
  ('Pendidikan Fisika', 'saintek', 'S1', array['Fisika','Matematika'], false, 70, 87, array[822,849,918], array[1116,1145,1296], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 92, 117, array[1129,1228,1335], array[1818,1812,1954], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":652}'::jsonb),
  ('Pendidikan Biologi', 'saintek', 'S1', array['Biologi'], false, 50, 61, array[622,645,699], array[846,888,983], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":640}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNDIKSHA'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNIMA (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 67, 80, array[962,1027,1149], array[1495,1479,1599], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb),
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 87, 110, array[1154,1191,1328], array[1951,2078,2165], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 83, 107, array[1215,1358,1381], array[1879,2001,1983], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 74, 88, array[970,988,1083], array[1628,1789,1884], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Pendidikan Ekonomi', 'soshum', 'S1', array['Ekonomi','Matematika'], false, 66, 96, array[825,883,982], array[1466,1564,1562], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":647}'::jsonb),
  ('Pendidikan Biologi', 'saintek', 'S1', array['Biologi'], false, 43, 73, array[553,585,631], array[769,769,865], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":642}'::jsonb),
  ('Pendidikan Anak Usia Dini', 'soshum', 'S1', array['Bahasa Indonesia'], false, 92, 105, array[1042,1131,1224], array[1371,1490,1507], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 65, 86, array[821,879,950], array[1127,1235,1325], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":644}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 41, 60, array[481,514,570], array[717,788,851], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 42, 78, array[555,628,676], array[815,913,952], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNIMA'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNG (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 66, 94, array[800,881,935], array[1421,1519,1652], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 84, 103, array[1054,1158,1220], array[1855,2122,2261], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 77, 116, array[965,1083,1162], array[1627,1759,1809], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 53, 88, array[629,665,692], array[1028,1065,1123], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":656}'::jsonb),
  ('Pendidikan Biologi', 'saintek', 'S1', array['Biologi'], false, 90, 107, array[1019,1042,1181], array[1788,1961,1965], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":653}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 46, 66, array[532,575,611], array[742,766,818], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Pendidikan Geografi', 'soshum', 'S1', array['Geografi'], false, 59, 76, array[681,713,774], array[1013,1155,1139], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":636}'::jsonb),
  ('Pendidikan Anak Usia Dini', 'soshum', 'S1', array['Bahasa Indonesia'], false, 76, 96, array[971,1086,1116], array[1601,1769,1949], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 67, 89, array[863,894,943], array[1429,1505,1606], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":639}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 93, 120, array[1113,1154,1264], array[1818,1973,2016], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNG'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNTAD (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 73, 103, array[967,972,1068], array[1602,1733,1780], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 82, 118, array[1075,1157,1282], array[1558,1594,1767], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":664}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 91, 102, array[1202,1269,1385], array[1824,1864,2056], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 41, 74, array[489,534,584], array[862,968,982], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":647}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 56, 73, array[685,751,808], array[1072,1076,1156], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 67, 75, array[895,957,1036], array[1279,1268,1415], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 67, 105, array[817,848,901], array[1274,1348,1415], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":682}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 73, 84, array[918,986,1057], array[1540,1595,1718], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":653}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 93, 126, array[1304,1374,1458], array[1854,2115,2226], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Matematika', 'saintek', 'S1', array['Matematika'], false, 81, 110, array[870,910,997], array[1319,1441,1500], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":652}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNTAD'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNTAN (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 95, 135, array[1433,1454,1556], array[2285,2504,2742], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 51, 87, array[735,791,854], array[1222,1348,1448], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":702}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 88, 118, array[1209,1295,1470], array[1712,1778,1869], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 61, 84, array[913,994,1091], array[1292,1311,1462], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 78, 105, array[950,1039,1092], array[1606,1627,1694], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 52, 79, array[655,682,751], array[1079,1221,1207], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 49, 66, array[618,658,705], array[949,1050,1047], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 87, 106, array[1184,1297,1331], array[2025,2162,2286], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 48, 72, array[644,652,729], array[1016,1126,1182], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 70, 93, array[937,1009,1029], array[1340,1442,1539], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNTAN'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- ULM (10 prodi)
insert into public.prodi (
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
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 85, 119, array[1140,1238,1354], array[1729,1847,1996], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 55, 70, array[700,753,826], array[1265,1337,1454], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":694}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 61, 70, array[943,1053,1136], array[1295,1433,1494], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 54, 90, array[789,823,873], array[1217,1322,1334], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 71, 101, array[972,1049,1122], array[1732,1907,1909], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 75, 114, array[940,1043,1067], array[1429,1535,1632], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 64, 90, array[746,811,900], array[1241,1251,1349], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 47, 66, array[621,657,697], array[1098,1109,1205], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 60, 87, array[788,832,910], array[1287,1378,1447], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 45, 59, array[596,608,656], array[808,879,968], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":648}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'ULM'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNJ (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 95, 124, array[1321,1334,1474], array[2201,2252,2464], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 46, 81, array[599,653,697], array[971,967,1036], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 47, 71, array[562,612,616], array[985,1096,1129], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 47, 59, array[582,634,665], array[968,1005,1085], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 86, 98, array[1122,1216,1283], array[2037,2067,2278], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Pendidikan Biologi', 'saintek', 'S1', array['Biologi'], false, 82, 113, array[932,975,1069], array[1478,1493,1668], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":654}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 53, 62, array[729,786,833], array[1040,1074,1108], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Pendidikan Fisika', 'saintek', 'S1', array['Fisika','Matematika'], false, 69, 93, array[796,872,903], array[1106,1155,1166], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 69, 90, array[848,921,1004], array[1289,1345,1517], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb),
  ('Pendidikan Ekonomi', 'soshum', 'S1', array['Ekonomi','Matematika'], false, 44, 64, array[528,558,598], array[821,871,883], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":644}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNJ'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNILA (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 86, 124, array[1144,1178,1245], array[1741,1793,1910], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":699}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 92, 108, array[1432,1572,1631], array[2461,2750,2801], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 88, 113, array[1232,1315,1392], array[1993,2045,2251], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 89, 117, array[1206,1349,1454], array[2068,2092,2303], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 69, 92, array[875,954,997], array[1566,1666,1771], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":664}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 96, 126, array[1230,1311,1388], array[1720,1851,1936], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 57, 86, array[748,800,846], array[1060,1112,1135], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 42, 78, array[584,654,679], array[871,910,985], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 73, 103, array[945,1027,1131], array[1332,1409,1554], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":682}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 70, 107, array[823,837,929], array[1082,1171,1239], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNILA'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNIB (10 prodi)
insert into public.prodi (
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
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 83, 109, array[1167,1198,1270], array[1561,1686,1712], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 59, 99, array[916,952,1004], array[1243,1300,1345], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 77, 97, array[1009,1090,1143], array[1475,1587,1680], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":703}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 62, 93, array[788,818,876], array[1348,1374,1451], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 53, 92, array[822,867,946], array[1445,1471,1566], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":690}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 91, 122, array[1120,1197,1259], array[1833,2060,2055], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":685}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 89, 112, array[1074,1121,1285], array[1441,1546,1579], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 42, 55, array[551,563,623], array[909,922,953], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":650}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 63, 77, array[828,888,900], array[1144,1160,1238], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 60, 100, array[746,785,861], array[1020,1066,1166], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNIB'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNJA (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 82, 93, array[1135,1231,1294], array[1539,1688,1847], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":696}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 50, 78, array[714,749,792], array[1080,1102,1199], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 72, 104, array[1094,1166,1222], array[1886,1884,2086], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 55, 74, array[890,924,980], array[1171,1269,1321], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 81, 90, array[1086,1129,1175], array[1441,1496,1641], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 68, 76, array[987,1047,1099], array[1665,1816,1922], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 97, 106, array[1231,1272,1326], array[1908,1968,2055], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Statistika', 'saintek', 'S1', array['Matematika'], false, 84, 121, array[1074,1132,1196], array[1420,1559,1652], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":647}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 53, 80, array[697,752,795], array[988,1090,1144], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 54, 84, array[733,803,852], array[1193,1241,1281], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":654}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNJA'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNRI (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 49, 85, array[708,797,828], array[1069,1112,1208], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 60, 89, array[875,920,1017], array[1362,1502,1505], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 73, 104, array[954,1043,1125], array[1492,1592,1726], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":693}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 78, 94, array[1217,1271,1319], array[2187,2297,2340], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 65, 96, array[872,895,992], array[1182,1284,1350], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 96, 108, array[1172,1255,1346], array[1823,1991,2023], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 65, 103, array[923,939,1037], array[1581,1752,1851], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 49, 87, array[646,684,709], array[910,994,1032], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 77, 94, array[939,987,1130], array[1366,1507,1539], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Administrasi Publik', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 40, 72, array[416,448,485], array[799,820,863], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":640}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNRI'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNSRI (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 50, 73, array[708,739,808], array[1208,1302,1429], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 85, 97, array[1113,1198,1281], array[1490,1548,1673], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 92, 103, array[1195,1347,1413], array[1800,1887,2039], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 71, 108, array[1019,1034,1096], array[1330,1520,1522], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":696}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 80, 104, array[1017,1096,1239], array[1805,1999,2105], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":700}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 85, 121, array[1173,1280,1346], array[1590,1730,1843], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 81, 112, array[1004,1100,1185], array[1711,1817,1836], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 64, 81, array[843,857,944], array[1098,1213,1279], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 50, 62, array[707,736,794], array[1027,1053,1137], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 88, 100, array[1249,1383,1488], array[1810,1964,2135], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":685}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNSRI'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UBB (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 56, 64, array[856,916,1033], array[1556,1586,1766], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":698}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 70, 94, array[974,1040,1106], array[1425,1564,1612], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 72, 97, array[960,1006,1065], array[1292,1396,1396], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 66, 98, array[898,958,1073], array[1185,1318,1379], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":694}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 94, 114, array[1210,1325,1403], array[1833,2007,2162], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":650}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 97, 121, array[1319,1339,1474], array[2340,2367,2628], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":661}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 58, 85, array[807,876,931], array[1516,1567,1598], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 90, 112, array[1262,1347,1383], array[2041,2062,2173], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":672}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 64, 81, array[781,795,861], array[1266,1267,1377], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('Statistika', 'saintek', 'S1', array['Matematika'], false, 40, 57, array[430,455,500], array[702,727,776], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":662}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UBB'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNTIRTA (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 67, 92, array[897,938,1049], array[1439,1505,1553], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":697}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 61, 80, array[769,789,849], array[1249,1412,1448], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 78, 96, array[1121,1152,1249], array[1896,1998,2239], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 68, 90, array[1064,1091,1169], array[1710,1914,1998], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":693}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 87, 101, array[1267,1394,1510], array[2150,2189,2485], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 48, 81, array[582,627,688], array[1000,1062,1125], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 47, 82, array[619,647,687], array[779,864,879], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":650}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 52, 74, array[634,681,752], array[1119,1197,1218], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 65, 92, array[828,891,991], array[1131,1222,1323], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 77, 90, array[963,1069,1170], array[1397,1494,1670], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":654}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNTIRTA'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNSOED (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 47, 62, array[601,652,662], array[900,937,997], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 77, 87, array[1235,1348,1440], array[1945,2051,2134], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 47, 84, array[611,676,700], array[981,994,1076], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":682}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 97, 115, array[1239,1321,1426], array[2145,2195,2376], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 46, 55, array[556,610,656], array[1003,1069,1121], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 47, 82, array[674,680,740], array[1092,1192,1292], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 95, 131, array[1136,1211,1231], array[1808,1824,1982], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 57, 73, array[628,685,730], array[891,943,1021], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 45, 62, array[567,607,644], array[814,877,888], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 80, 118, array[1181,1236,1341], array[1613,1832,1878], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":662}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNSOED'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNEJ (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 49, 60, array[755,810,896], array[1280,1289,1458], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":698}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 74, 96, array[1157,1264,1370], array[1967,2154,2224], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 96, 128, array[1419,1476,1537], array[2155,2250,2490], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":694}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 45, 60, array[654,689,718], array[912,991,1029], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 86, 124, array[1116,1208,1234], array[1578,1722,1796], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 60, 91, array[864,877,953], array[1439,1450,1598], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":664}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 61, 86, array[801,863,894], array[1341,1374,1515], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 68, 97, array[856,890,988], array[1332,1479,1548], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Sastra Inggris', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 70, 82, array[912,956,1041], array[1341,1459,1532], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":651}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 62, 70, array[803,849,892], array[1400,1541,1633], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNEJ'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNSYIAH (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 68, 94, array[882,915,1011], array[1569,1648,1680], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 52, 83, array[797,841,903], array[1293,1441,1521], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":695}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 48, 86, array[681,723,778], array[1270,1294,1420], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":692}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 93, 124, array[1518,1613,1781], array[2263,2443,2639], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":704}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 70, 94, array[879,943,1056], array[1471,1580,1683], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":662}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 69, 99, array[1023,1104,1225], array[1751,1869,2023], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 92, 121, array[1200,1254,1367], array[1851,1881,2047], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 93, 113, array[1261,1378,1503], array[2087,2148,2329], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":652}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 57, 78, array[817,899,951], array[1409,1427,1556], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 72, 102, array[900,989,1045], array[1283,1443,1526], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNSYIAH'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNIMED (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 77, 101, array[897,978,1039], array[1580,1661,1766], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb),
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 70, 86, array[951,963,1087], array[1576,1663,1765], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 75, 108, array[1102,1149,1252], array[1591,1666,1846], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 85, 99, array[1090,1128,1227], array[1572,1663,1702], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":654}'::jsonb),
  ('Pendidikan Anak Usia Dini', 'soshum', 'S1', array['Bahasa Indonesia'], false, 72, 108, array[800,881,955], array[1130,1214,1245], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":656}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 61, 81, array[774,799,886], array[1350,1413,1479], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Pendidikan Biologi', 'saintek', 'S1', array['Biologi'], false, 67, 97, array[853,903,1013], array[1103,1245,1342], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 70, 84, array[875,940,997], array[1175,1308,1355], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 93, 117, array[1109,1152,1222], array[1629,1744,1882], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":644}'::jsonb),
  ('Pendidikan Fisika', 'saintek', 'S1', array['Fisika','Matematika'], false, 53, 64, array[593,633,654], array[763,868,870], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNIMED'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- USU (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 56, 89, array[744,771,851], array[1319,1328,1450], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":693}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 98, 112, array[1364,1492,1582], array[2073,2067,2215], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":691}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 66, 85, array[972,1008,1072], array[1714,1761,1909], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 96, 115, array[1484,1498,1669], array[2255,2315,2438], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 42, 62, array[617,647,695], array[975,1015,1118], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 48, 70, array[663,669,736], array[893,951,1001], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":664}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 93, 101, array[1321,1446,1584], array[1980,2042,2241], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 80, 101, array[952,1018,1087], array[1247,1424,1448], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":667}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 59, 90, array[751,805,886], array[1279,1332,1377], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 53, 80, array[775,799,840], array[1013,1055,1174], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'USU'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNP (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Matematika', 'soshum', 'S1', array['Matematika'], false, 43, 83, array[570,577,621], array[1006,1055,1061], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Pendidikan Bahasa Indonesia', 'soshum', 'S1', array['Bahasa Indonesia'], false, 43, 76, array[546,582,597], array[733,776,796], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Pendidikan Guru Sekolah Dasar', 'soshum', 'S1', array['Bahasa Indonesia','Matematika'], false, 67, 102, array[940,1004,1030], array[1493,1524,1669], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Pendidikan Bahasa Inggris', 'soshum', 'S1', array['Bahasa Inggris'], false, 94, 129, array[1155,1188,1321], array[1560,1737,1775], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('Bimbingan dan Konseling', 'soshum', 'S1', array['Bahasa Indonesia','PPKn'], false, 87, 125, array[1078,1140,1209], array[1550,1669,1780], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Pendidikan Biologi', 'saintek', 'S1', array['Biologi'], false, 79, 104, array[938,983,1004], array[1630,1669,1858], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":648}'::jsonb),
  ('Pendidikan Fisika', 'saintek', 'S1', array['Fisika','Matematika'], false, 94, 127, array[1158,1258,1340], array[1673,1784,1885], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":639}'::jsonb),
  ('Pendidikan Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 54, 69, array[606,662,720], array[966,998,1049], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":648}'::jsonb),
  ('Pendidikan Ekonomi', 'soshum', 'S1', array['Ekonomi','Matematika'], false, 74, 106, array[873,900,943], array[1105,1229,1311], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":639}'::jsonb),
  ('Pendidikan Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 59, 91, array[775,809,869], array[1327,1469,1533], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":650}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNP'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNTIDAR (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 70, 105, array[829,904,962], array[1570,1600,1728], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":685}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 86, 94, array[1235,1378,1504], array[1902,2009,2134], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":698}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 72, 96, array[876,956,980], array[1522,1506,1659], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":692}'::jsonb),
  ('Akuntansi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 92, 119, array[1131,1201,1266], array[1770,1846,1932], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 79, 95, array[965,1033,1067], array[1349,1512,1532], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 45, 64, array[656,713,797], array[893,976,1017], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 93, 103, array[1194,1269,1374], array[2060,2091,2235], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 42, 54, array[491,525,567], array[615,685,712], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 95, 117, array[1250,1355,1432], array[1700,1936,2051], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 42, 66, array[570,585,637], array[879,929,961], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNTIDAR'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UHO (10 prodi)
insert into public.prodi (
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
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 97, 110, array[1232,1324,1403], array[2185,2217,2293], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":698}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 82, 108, array[1064,1116,1222], array[1925,1909,2089], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 85, 119, array[1230,1357,1388], array[1555,1758,1882], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":701}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 77, 111, array[1158,1212,1336], array[1708,1845,1921], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 50, 62, array[769,813,854], array[1217,1261,1331], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 55, 77, array[815,872,927], array[1310,1318,1393], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":693}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 54, 79, array[715,740,799], array[1129,1278,1286], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 88, 114, array[1109,1145,1224], array[1844,1918,2095], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":648}'::jsonb),
  ('Ilmu Komunikasi', 'soshum', 'S1', array['Bahasa Indonesia','Bahasa Inggris'], false, 88, 97, array[1025,1140,1237], array[1488,1540,1611], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Statistika', 'saintek', 'S1', array['Matematika'], false, 62, 96, array[776,837,891], array[1215,1295,1374], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UHO'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNPATTI (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 73, 102, array[1049,1107,1180], array[1494,1552,1620], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 86, 119, array[1270,1373,1421], array[1862,1977,2002], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 56, 90, array[854,899,958], array[1169,1287,1292], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":692}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 67, 87, array[896,993,1065], array[1342,1442,1527], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":685}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 61, 79, array[792,866,891], array[1042,1145,1241], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":689}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 82, 121, array[1157,1174,1307], array[1801,1964,2093], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 45, 66, array[601,658,705], array[947,1017,1060], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 88, 114, array[1041,1088,1151], array[1396,1389,1545], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Ilmu Ekonomi', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 79, 89, array[1047,1157,1183], array[1649,1666,1823], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 44, 58, array[580,613,685], array[1012,1020,1137], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":648}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNPATTI'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UNCEN (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'saintek', 'S1', array['Biologi','Kimia'], false, 94, 124, array[1280,1332,1479], array[1919,1969,2187], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 43, 76, array[569,619,655], array[890,929,969], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb),
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 90, 106, array[1261,1336,1519], array[2099,2225,2349], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":702}'::jsonb),
  ('Kedokteran Gigi', 'saintek', 'S1', array['Biologi','Kimia'], false, 88, 102, array[1236,1285,1380], array[1718,1888,2013], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":683}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 64, 94, array[955,1017,1049], array[1524,1632,1766], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 55, 66, array[773,824,856], array[1086,1142,1211], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 79, 113, array[1121,1205,1310], array[1534,1631,1863], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":677}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 44, 81, array[547,601,611], array[816,867,931], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Sastra Inggris', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 46, 66, array[580,606,627], array[730,825,835], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('Farmasi', 'saintek', 'S1', array['Kimia','Biologi'], false, 53, 67, array[789,829,893], array[1277,1364,1519], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UNCEN'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- ITERA (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 64, 86, array[896,931,1053], array[1251,1305,1456], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":688}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 82, 106, array[1140,1256,1326], array[1881,2022,2047], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":684}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 94, 129, array[1182,1255,1319], array[2060,2268,2298], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 58, 92, array[756,801,895], array[1129,1181,1308], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":661}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 84, 108, array[1007,1072,1113], array[1417,1425,1553], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 86, 116, array[1157,1261,1348], array[1778,2004,1997], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('Sistem Informasi', 'saintek', 'S1', array['Matematika','Fisika'], false, 47, 68, array[616,658,739], array[890,948,974], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('Teknik Material', 'saintek', 'S1', array['Fisika','Kimia'], false, 40, 63, array[493,549,583], array[759,775,849], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":645}'::jsonb),
  ('Teknik Geodesi', 'saintek', 'S1', array['Matematika','Fisika'], false, 61, 98, array[672,709,788], array[857,932,953], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":82.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 47, 57, array[624,683,707], array[999,1127,1139], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":648}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'ITERA'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- ITK (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 98, 120, array[1434,1542,1611], array[2493,2590,2643], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":701}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 63, 73, array[935,977,1029], array[1526,1665,1722], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Teknik Mesin', 'saintek', 'S1', array['Matematika','Fisika'], false, 68, 104, array[892,933,986], array[1248,1357,1428], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 66, 104, array[863,924,1010], array[1412,1595,1649], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 92, 115, array[1150,1256,1311], array[1684,1870,1974], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":680}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 54, 64, array[728,797,859], array[1184,1191,1302], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('Teknik Lingkungan', 'saintek', 'S1', array['Matematika','Fisika'], false, 65, 74, array[743,769,868], array[1169,1241,1337], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":634}'::jsonb),
  ('Sistem Informasi', 'saintek', 'S1', array['Matematika','Fisika'], false, 95, 112, array[1205,1279,1430], array[2239,2341,2391], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":674}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 62, 92, array[744,798,880], array[1321,1397,1519], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Teknik Pertambangan', 'saintek', 'S1', array['Matematika','Fisika'], false, 81, 99, array[985,1057,1165], array[1800,1961,2057], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'ITK'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- PNJ (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Sipil', 'campuran', 'D4', array['Matematika','Fisika'], false, 61, 92, array[840,890,936], array[1459,1457,1578], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":651}'::jsonb),
  ('D4 Teknik Mesin', 'campuran', 'D4', array['Matematika','Fisika'], false, 71, 89, array[929,960,1073], array[1197,1309,1356], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('D4 Manajemen Pemasaran', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 48, 73, array[660,673,763], array[994,1076,1124], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('D4 Administrasi Bisnis', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 46, 63, array[566,580,652], array[895,918,970], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":662}'::jsonb),
  ('D4 Akuntansi', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 60, 88, array[706,730,823], array[908,955,1067], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('D4 Teknik Kimia', 'campuran', 'D4', array['Kimia','Matematika'], false, 83, 107, array[968,1052,1093], array[1446,1656,1681], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":637}'::jsonb),
  ('D4 Teknik Otomotif', 'campuran', 'D4', array['Matematika','Fisika'], false, 71, 100, array[840,891,958], array[1157,1185,1253], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb),
  ('D4 Teknik Informatika', 'campuran', 'D4', array['Matematika','Fisika'], false, 51, 63, array[719,800,871], array[1111,1136,1179], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('D4 Teknik Elektro', 'campuran', 'D4', array['Matematika','Fisika'], false, 62, 88, array[832,876,906], array[1072,1133,1210], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('D4 Teknik Telekomunikasi', 'campuran', 'D4', array['Matematika','Fisika'], false, 74, 84, array[815,880,929], array[1049,1168,1207], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'PNJ'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- POLBAN (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Informatika', 'campuran', 'D4', array['Matematika','Fisika'], false, 36, 58, array[498,521,554], array[768,807,865], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":673}'::jsonb),
  ('D4 Akuntansi', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 82, 97, array[984,1009,1062], array[1602,1642,1728], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":653}'::jsonb),
  ('D4 Teknik Mesin', 'campuran', 'D4', array['Matematika','Fisika'], false, 71, 110, array[800,847,905], array[1392,1430,1558], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('D4 Teknik Sipil', 'campuran', 'D4', array['Matematika','Fisika'], false, 68, 84, array[871,973,999], array[1488,1692,1677], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":662}'::jsonb),
  ('D4 Teknik Kimia', 'campuran', 'D4', array['Kimia','Matematika'], false, 38, 47, array[436,461,502], array[639,657,700], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('D4 Teknik Telekomunikasi', 'campuran', 'D4', array['Matematika','Fisika'], false, 39, 54, array[420,476,515], array[755,758,824], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('D4 Administrasi Bisnis', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 38, 57, array[518,554,596], array[883,880,982], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":678}'::jsonb),
  ('D4 Teknik Otomotif', 'campuran', 'D4', array['Matematika','Fisika'], false, 84, 98, array[988,1098,1164], array[1412,1480,1648], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":662}'::jsonb),
  ('D4 Manajemen Pemasaran', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 52, 63, array[713,752,793], array[916,1003,1019], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('D4 Teknik Elektro', 'campuran', 'D4', array['Matematika','Fisika'], false, 76, 88, array[898,956,991], array[1383,1459,1532], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'POLBAN'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- POLINES (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Otomotif', 'campuran', 'D4', array['Matematika','Fisika'], false, 47, 66, array[591,611,673], array[834,923,975], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":652}'::jsonb),
  ('D4 Teknik Telekomunikasi', 'campuran', 'D4', array['Matematika','Fisika'], false, 61, 89, array[768,818,905], array[1197,1307,1374], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":641}'::jsonb),
  ('D4 Administrasi Bisnis', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 40, 65, array[486,518,563], array[698,765,765], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":649}'::jsonb),
  ('D4 Teknik Informatika', 'campuran', 'D4', array['Matematika','Fisika'], false, 79, 97, array[1055,1109,1166], array[1534,1681,1727], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":669}'::jsonb),
  ('D4 Teknik Elektro', 'campuran', 'D4', array['Matematika','Fisika'], false, 63, 82, array[799,838,869], array[1334,1500,1596], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":676}'::jsonb),
  ('D4 Manajemen Pemasaran', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 38, 65, array[476,506,544], array[832,930,989], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":83.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":644}'::jsonb),
  ('D4 Teknik Sipil', 'campuran', 'D4', array['Matematika','Fisika'], false, 84, 119, array[1087,1173,1273], array[1706,1940,2005], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('D4 Akuntansi', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 56, 71, array[703,770,782], array[1216,1335,1370], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":663}'::jsonb),
  ('D4 Teknik Mesin', 'campuran', 'D4', array['Matematika','Fisika'], false, 48, 59, array[586,641,678], array[1084,1147,1170], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":645}'::jsonb),
  ('D4 Teknik Kimia', 'campuran', 'D4', array['Kimia','Matematika'], false, 51, 60, array[562,598,671], array[784,805,867], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":668}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'POLINES'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- PENS (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Informatika', 'campuran', 'D4', array['Matematika','Fisika'], false, 52, 92, array[725,770,814], array[1065,1107,1148], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('D4 Akuntansi', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 60, 81, array[731,771,800], array[1051,1106,1219], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":681}'::jsonb),
  ('D4 Teknik Sipil', 'campuran', 'D4', array['Matematika','Fisika'], false, 38, 77, array[440,479,528], array[817,839,909], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":671}'::jsonb),
  ('D4 Manajemen Pemasaran', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 53, 66, array[705,740,824], array[1280,1385,1388], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('D4 Teknik Mesin', 'campuran', 'D4', array['Matematika','Fisika'], false, 77, 102, array[849,945,996], array[1632,1655,1782], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":644}'::jsonb),
  ('D4 Teknik Otomotif', 'campuran', 'D4', array['Matematika','Fisika'], false, 69, 80, array[804,860,906], array[1159,1229,1271], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('D4 Administrasi Bisnis', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 51, 84, array[688,732,778], array[1085,1147,1217], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('D4 Teknik Elektro', 'campuran', 'D4', array['Matematika','Fisika'], false, 84, 108, array[980,1065,1115], array[1541,1666,1801], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('D4 Teknik Kimia', 'campuran', 'D4', array['Kimia','Matematika'], false, 39, 55, array[486,526,554], array[624,703,705], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":634}'::jsonb),
  ('D4 Teknik Telekomunikasi', 'campuran', 'D4', array['Matematika','Fisika'], false, 74, 109, array[908,935,1017], array[1619,1687,1807], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'PENS'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- POLINEMA (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Informatika', 'campuran', 'D4', array['Matematika','Fisika'], false, 53, 80, array[721,796,812], array[1288,1435,1432], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":686}'::jsonb),
  ('D4 Manajemen Pemasaran', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 56, 77, array[637,705,744], array[942,940,1007], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":656}'::jsonb),
  ('D4 Administrasi Bisnis', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 38, 46, array[516,538,591], array[728,757,857], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.6}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('D4 Teknik Mesin', 'campuran', 'D4', array['Matematika','Fisika'], false, 57, 83, array[654,678,749], array[1141,1241,1273], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.5}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":646}'::jsonb),
  ('D4 Teknik Elektro', 'campuran', 'D4', array['Matematika','Fisika'], false, 40, 61, array[457,490,529], array[793,866,914], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":658}'::jsonb),
  ('D4 Akuntansi', 'campuran', 'D4', array['Matematika','Ekonomi'], false, 40, 69, array[488,538,557], array[809,863,976], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.3}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":660}'::jsonb),
  ('D4 Teknik Kimia', 'campuran', 'D4', array['Kimia','Matematika'], false, 39, 52, array[446,482,504], array[725,764,805], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":635}'::jsonb),
  ('D4 Teknik Telekomunikasi', 'campuran', 'D4', array['Matematika','Fisika'], false, 42, 67, array[503,513,553], array[804,863,920], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":84.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":645}'::jsonb),
  ('D4 Teknik Sipil', 'campuran', 'D4', array['Matematika','Fisika'], false, 48, 64, array[587,599,661], array[888,1012,1067], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":653}'::jsonb),
  ('D4 Teknik Otomotif', 'campuran', 'D4', array['Matematika','Fisika'], false, 56, 70, array[625,665,736], array[961,1019,1127], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.7}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":648}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'POLINEMA'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

-- UPR (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'saintek', 'S1', array['Matematika','Fisika'], false, 92, 107, array[1229,1262,1359], array[1743,1818,1968], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":88.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":695}'::jsonb),
  ('Ilmu Hukum', 'soshum', 'S1', array['PPKn','Bahasa Indonesia'], false, 72, 96, array[1021,1103,1193], array[1453,1638,1668], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.9}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":665}'::jsonb),
  ('Manajemen', 'soshum', 'S1', array['Matematika','Ekonomi'], false, 93, 123, array[1138,1267,1288], array[1503,1558,1744], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":670}'::jsonb),
  ('Hubungan Internasional', 'soshum', 'S1', array['Bahasa Inggris','Bahasa Indonesia'], false, 69, 98, array[1028,1109,1137], array[1764,1928,1991], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":659}'::jsonb),
  ('Psikologi', 'soshum', 'S1', array['Matematika','Bahasa Indonesia'], false, 71, 101, array[920,993,1111], array[1644,1827,1874], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":679}'::jsonb),
  ('Teknik Elektro', 'saintek', 'S1', array['Matematika','Fisika'], false, 65, 89, array[877,963,1042], array[1551,1703,1772], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":87.2}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":672}'::jsonb),
  ('Arsitektur', 'saintek', 'S1', array['Matematika','Fisika'], false, 44, 71, array[540,577,616], array[865,925,1029], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":85.4}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":666}'::jsonb),
  ('Teknik Industri', 'saintek', 'S1', array['Matematika','Fisika'], false, 90, 122, array[1264,1412,1473], array[1940,2022,2205], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":675}'::jsonb),
  ('Teknik Kimia', 'saintek', 'S1', array['Kimia','Matematika'], false, 57, 93, array[781,789,885], array[1366,1407,1498], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.1}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":657}'::jsonb),
  ('Teknik Sipil', 'saintek', 'S1', array['Matematika','Fisika'], false, 43, 60, array[555,584,637], array[881,900,961], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1,"median_snbp":86.8}'::jsonb, '{"PU":0.15,"PPU":0.13,"PBM":0.13,"PK":0.15,"LBI":0.15,"LBE":0.14,"PM":0.15,"median_snbt":687}'::jsonb)
) as v(nama, rumpun, jenjang, mapel, butuh, dsnbp, dsnbt, psnbp, psnbt, bobot, bobot_snbt)
where p.singkatan = 'UPR'
  and not exists (
    select 1 from public.prodi x
    where x.ptn_id = p.id and x.nama = v.nama
  );

commit;

-- Cek hasil:
-- select count(*) as total_prodi from public.prodi;
-- select count(*) as total_ptn from public.ptn;
