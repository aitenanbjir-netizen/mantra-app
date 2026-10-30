-- ================================================================
-- MANTRA — SEED 500 PRODI (AUTO-GENERATED)
-- Jalankan SETELAH supabase/schema.sql di SQL Editor.
-- Angka daya tampung, peminat, dan median adalah estimasi wajar,
-- bukan angka resmi SNPMB. Ganti dengan data resmi bila tersedia.
-- ================================================================

begin;

insert into public.ptn (nama, singkatan, kota) values
  ('Universitas Indonesia', 'UI', 'Depok'),
  ('Institut Teknologi Bandung', 'ITB', 'Bandung'),
  ('Universitas Gadjah Mada', 'UGM', 'Yogyakarta'),
  ('Institut Pertanian Bogor', 'IPB', 'Bogor'),
  ('Institut Teknologi Sepuluh Nopember', 'ITS', 'Surabaya'),
  ('Universitas Diponegoro', 'UNDIP', 'Semarang'),
  ('Universitas Brawijaya', 'UB', 'Malang'),
  ('Universitas Padjadjaran', 'UNPAD', 'Bandung'),
  ('Universitas Hasanuddin', 'UNHAS', 'Makassar'),
  ('Universitas Airlangga', 'UNAIR', 'Surabaya'),
  ('Universitas Andalas', 'UNAND', 'Padang'),
  ('Universitas Negeri Semarang', 'UNNES', 'Semarang'),
  ('Universitas Negeri Yogyakarta', 'UNY', 'Yogyakarta'),
  ('Universitas Sebelas Maret', 'UNS', 'Surakarta'),
  ('Universitas Pendidikan Indonesia', 'UPI', 'Bandung'),
  ('Universitas Negeri Malang', 'UNM', 'Malang'),
  ('Universitas Udayana', 'UNUD', 'Denpasar'),
  ('Universitas Mataram', 'UNRAM', 'Mataram'),
  ('Universitas Pendidikan Ganesha', 'UNDIKSHA', 'Singaraja'),
  ('Universitas Negeri Manado', 'UNIMA', 'Tondano'),
  ('Universitas Negeri Gorontalo', 'UNG', 'Gorontalo'),
  ('Universitas Tadulako', 'UNTAD', 'Palu'),
  ('Universitas Tanjungpura', 'UNTAN', 'Pontianak'),
  ('Universitas Lambung Mangkurat', 'ULM', 'Banjarmasin'),
  ('Universitas Negeri Jakarta', 'UNJ', 'Jakarta'),
  ('Universitas Lampung', 'UNILA', 'Bandar Lampung'),
  ('Universitas Bengkulu', 'UNIB', 'Bengkulu'),
  ('Universitas Jambi', 'UNJA', 'Jambi'),
  ('Universitas Riau', 'UNRI', 'Pekanbaru'),
  ('Universitas Sriwijaya', 'UNSRI', 'Palembang'),
  ('Universitas Bangka Belitung', 'UBB', 'Pangkal Pinang'),
  ('Universitas Sultan Ageng Tirtayasa', 'UNTIRTA', 'Serang'),
  ('Universitas Jenderal Soedirman', 'UNSOED', 'Purwokerto'),
  ('Universitas Jember', 'UNEJ', 'Jember'),
  ('Universitas Syiah Kuala', 'UNSYIAH', 'Banda Aceh'),
  ('Universitas Negeri Medan', 'UNIMED', 'Medan'),
  ('Universitas Sumatera Utara', 'USU', 'Medan'),
  ('Universitas Negeri Padang', 'UNP', 'Padang'),
  ('Universitas Tidar', 'UNTIDAR', 'Magelang'),
  ('Universitas Halu Oleo', 'UHO', 'Kendari'),
  ('Universitas Pattimura', 'UNPATTI', 'Ambon'),
  ('Universitas Cenderawasih', 'UNCEN', 'Jayapura'),
  ('Institut Teknologi Sumatera', 'ITERA', 'Lampung Selatan'),
  ('Institut Teknologi Kalimantan', 'ITK', 'Balikpapan'),
  ('Politeknik Negeri Jakarta', 'PNJ', 'Depok'),
  ('Politeknik Negeri Bandung', 'POLBAN', 'Bandung'),
  ('Politeknik Negeri Semarang', 'POLINES', 'Semarang'),
  ('Politeknik Elektronika Negeri Surabaya', 'PENS', 'Surabaya'),
  ('Politeknik Negeri Malang', 'POLINEMA', 'Malang'),
  ('Universitas Palangka Raya', 'UPR', 'Palangka Raya')
on conflict (singkatan) do update
set nama = excluded.nama, kota = excluded.kota;

-- UI (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 65, 96, array[1031,1098,1215], array[1829,1978,2191], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 686),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 65, 77, array[918,969,1030], array[1411,1545,1562], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 696),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 87, 103, array[1202,1279,1351], array[1735,1848,1955], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.4, 688),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 73, 87, array[1052,1110,1200], array[1676,1783,1802], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 679),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 92, 105, array[1269,1344,1508], array[2024,2002,2240], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 682),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 91, 111, array[1265,1334,1384], array[2194,2238,2450], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.7, 677),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 77, 93, array[1012,1060,1079], array[1384,1526,1563], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 668),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 73, 90, array[902,976,1007], array[1476,1494,1549], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 659),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 61, 93, array[785,874,910], array[1379,1531,1577], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 667),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 81, 116, array[1042,1151,1177], array[1421,1526,1593], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 682)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UI'
on conflict (ptn_id, nama) do nothing;

-- ITB (10 prodi)
insert into public.prodi (
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
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 52, 79, array[713,749,816], array[1045,1179,1225], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 690),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 67, 90, array[896,952,983], array[1212,1241,1331], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 681),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 72, 111, array[928,944,1008], array[1325,1437,1494], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.5, 670),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 68, 107, array[1034,1111,1222], array[1363,1458,1571], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 702),
  ('Sistem Informasi', 'Saintek', array['Matematika','Fisika'], 61, 95, array[957,988,1069], array[1537,1564,1666], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 670),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 52, 76, array[658,711,737], array[1152,1225,1268], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 688),
  ('Teknik Material', 'Saintek', array['Fisika','Kimia'], 73, 93, array[908,1027,1071], array[1257,1341,1395], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 651),
  ('Teknik Pertambangan', 'Saintek', array['Matematika','Fisika'], 77, 86, array[948,1020,1108], array[1740,1750,1944], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.2, 655),
  ('Teknik Geodesi', 'Saintek', array['Matematika','Fisika'], 64, 98, array[744,793,849], array[1213,1382,1405], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 637),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 51, 90, array[608,651,687], array[1114,1175,1208], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 675)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'ITB'
on conflict (ptn_id, nama) do nothing;

-- UGM (10 prodi)
insert into public.prodi (
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
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 53, 79, array[677,729,813], array[1068,1227,1209], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 680),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 70, 87, array[1114,1176,1265], array[1902,2036,2215], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 705),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 61, 71, array[894,964,1013], array[1511,1568,1597], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 681),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 84, 95, array[1168,1261,1356], array[1776,1940,2019], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 699),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 85, 103, array[1130,1154,1296], array[1754,1779,1928], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 690),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 85, 101, array[1178,1257,1292], array[2025,2138,2270], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 695),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 60, 96, array[810,874,933], array[1009,1134,1170], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.3, 678),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 43, 53, array[654,688,729], array[969,1005,1109], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.4, 665),
  ('Statistika', 'Saintek', array['Matematika'], 80, 92, array[965,1093,1171], array[1491,1509,1653], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 653),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 67, 91, array[951,1049,1064], array[1351,1427,1477], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 688)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UGM'
on conflict (ptn_id, nama) do nothing;

-- IPB (10 prodi)
insert into public.prodi (
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
  ('Agroteknologi', 'Saintek', array['Biologi','Kimia'], 87, 104, array[1090,1219,1301], array[1552,1663,1738], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 687),
  ('Peternakan', 'Saintek', array['Biologi','Kimia'], 78, 99, array[1009,1090,1195], array[1460,1538,1689], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 670),
  ('Teknologi Pangan', 'Saintek', array['Biologi','Kimia'], 90, 103, array[1128,1176,1326], array[1946,2111,2294], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 682),
  ('Agribisnis', 'Saintek', array['Biologi','Ekonomi'], 62, 73, array[815,868,953], array[1383,1482,1565], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 689),
  ('Kedokteran Hewan', 'Saintek', array['Biologi','Kimia'], 78, 99, array[1208,1231,1323], array[1925,1962,2032], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 671),
  ('Teknologi Industri Pertanian', 'Saintek', array['Matematika','Fisika'], 57, 69, array[639,673,705], array[1004,1086,1167], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 670),
  ('Kehutanan', 'Saintek', array['Biologi','Geografi'], 52, 65, array[666,711,769], array[937,1005,1047], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 673),
  ('Proteksi Tanaman', 'Saintek', array['Biologi','Kimia'], 76, 104, array[890,970,1033], array[1524,1578,1771], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 646),
  ('Biologi', 'Saintek', array['Biologi','Kimia'], 42, 72, array[553,597,658], array[843,922,947], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 652),
  ('Gizi', 'Saintek', array['Biologi','Kimia'], 85, 117, array[1152,1177,1320], array[1447,1601,1670], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 689)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'IPB'
on conflict (ptn_id, nama) do nothing;

-- ITS (10 prodi)
insert into public.prodi (
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
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 50, 81, array[615,670,700], array[823,875,940], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.4, 675),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 93, 105, array[1401,1425,1520], array[2391,2481,2686], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 675),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 95, 109, array[1441,1572,1611], array[2012,2122,2218], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 671),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 85, 96, array[1265,1398,1490], array[2368,2475,2651], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 689),
  ('Sistem Informasi', 'Saintek', array['Matematika','Fisika'], 70, 105, array[998,1055,1098], array[1443,1540,1727], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.7, 698),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 80, 102, array[940,1044,1110], array[1538,1675,1780], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 666),
  ('Teknik Material', 'Saintek', array['Fisika','Kimia'], 45, 59, array[515,552,629], array[825,858,909], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.9, 656),
  ('Teknik Pertambangan', 'Saintek', array['Matematika','Fisika'], 50, 75, array[644,688,776], array[1066,1082,1156], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 654),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 54, 79, array[708,762,831], array[1019,1146,1194], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.8, 687),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 85, 121, array[1272,1373,1430], array[1870,2043,2077], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 675)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'ITS'
on conflict (ptn_id, nama) do nothing;

-- UNDIP (10 prodi)
insert into public.prodi (
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
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 48, 73, array[693,737,802], array[1117,1152,1224], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 675),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 99, 113, array[1549,1642,1805], array[2105,2201,2335], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.8, 677),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 77, 109, array[1122,1148,1200], array[1500,1568,1685], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.4, 696),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 52, 62, array[755,824,901], array[1205,1265,1339], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 666),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 83, 93, array[1124,1179,1232], array[1665,1734,1818], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 693),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 70, 94, array[929,1003,1082], array[1330,1344,1482], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 691),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 45, 67, array[595,648,695], array[988,1065,1136], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 671),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 91, 125, array[1187,1263,1380], array[1756,1881,1956], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.5, 669),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 58, 68, array[739,812,846], array[1224,1316,1398], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 671),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 47, 63, array[583,618,692], array[765,835,883], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 669)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNDIP'
on conflict (ptn_id, nama) do nothing;

-- UB (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 87, 105, array[1153,1192,1326], array[2018,2084,2131], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 688),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 76, 111, array[1088,1138,1207], array[1877,1914,1988], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 686),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 65, 77, array[952,1011,1135], array[1713,1818,1941], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 690),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 44, 71, array[681,705,748], array[944,964,1029], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 671),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 45, 67, array[670,716,766], array[1148,1251,1322], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 696),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 57, 80, array[804,864,909], array[1016,1158,1219], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 667),
  ('Statistika', 'Saintek', array['Matematika'], 50, 83, array[604,658,714], array[966,1047,1075], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.7, 651),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 56, 86, array[704,772,779], array[1223,1311,1340], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.3, 664),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 56, 88, array[813,857,918], array[1112,1197,1248], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 666),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 96, 132, array[1213,1281,1370], array[1671,1774,1907], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 681)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UB'
on conflict (ptn_id, nama) do nothing;

-- UNPAD (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 68, 86, array[991,1016,1098], array[1350,1431,1450], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.3, 697),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 55, 94, array[695,765,812], array[1036,1052,1118], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 686),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 95, 132, array[1429,1482,1618], array[2468,2503,2652], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88, 697),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 60, 99, array[848,909,1021], array[1601,1657,1745], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 673),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 82, 96, array[1094,1159,1272], array[1548,1620,1733], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.3, 701),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 58, 95, array[885,930,983], array[1463,1491,1648], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 699),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 92, 127, array[1391,1489,1611], array[1903,2031,2026], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 663),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 46, 81, array[723,780,801], array[960,1036,1048], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.7, 695),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 96, 122, array[1351,1502,1593], array[1771,1939,1985], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.2, 684),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 70, 79, array[998,1050,1140], array[1538,1712,1725], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 683)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNPAD'
on conflict (ptn_id, nama) do nothing;

-- UNHAS (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 64, 102, array[935,972,1048], array[1300,1322,1391], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.9, 675),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 94, 103, array[1528,1619,1736], array[2407,2597,2744], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.8, 674),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 85, 97, array[1280,1350,1470], array[2053,2105,2239], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 675),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 51, 65, array[798,839,938], array[1286,1365,1398], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 676),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 98, 132, array[1350,1365,1482], array[2113,2254,2247], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 699),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 59, 85, array[787,847,907], array[1122,1196,1255], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 697),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 70, 80, array[926,981,1028], array[1212,1278,1353], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 684),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 44, 72, array[575,612,649], array[973,1067,1080], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.5, 680),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 81, 91, array[1037,1128,1223], array[1610,1692,1788], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 687),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 77, 90, array[1064,1142,1160], array[1749,1921,2102], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 679)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNHAS'
on conflict (ptn_id, nama) do nothing;

-- UNAIR (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 99, 121, array[1500,1625,1700], array[2150,2305,2533], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 675),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 46, 67, array[602,654,708], array[806,853,923], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 679),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 97, 116, array[1299,1359,1481], array[2325,2520,2571], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 682),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 81, 113, array[1193,1238,1386], array[1721,1789,1830], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 689),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 61, 88, array[882,948,1033], array[1373,1529,1509], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 681),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 70, 84, array[1049,1109,1177], array[1431,1612,1678], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 689),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 60, 97, array[854,894,945], array[1275,1341,1435], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 667),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 85, 117, array[1189,1344,1405], array[2066,2183,2279], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 685),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 53, 65, array[795,880,906], array[1391,1492,1606], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.5, 682),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 93, 105, array[1101,1214,1332], array[1714,1869,1941], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.2, 664)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNAIR'
on conflict (ptn_id, nama) do nothing;

-- UNAND (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 51, 60, array[696,727,779], array[1165,1274,1330], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.6, 687),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 83, 108, array[1258,1383,1513], array[2213,2306,2425], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 679),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 65, 99, array[874,927,986], array[1394,1437,1536], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 702),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 49, 79, array[740,784,812], array[1123,1111,1235], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 694),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 58, 75, array[760,846,889], array[1274,1375,1422], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 671),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 50, 86, array[758,824,863], array[1268,1379,1439], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 691),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 54, 83, array[677,730,803], array[1000,1049,1079], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.4, 661),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 59, 75, array[801,871,942], array[1102,1161,1181], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.8, 665),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 98, 115, array[1274,1334,1453], array[2039,2071,2298], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 656),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 92, 110, array[1440,1477,1632], array[2319,2558,2712], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.5, 697)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNAND'
on conflict (ptn_id, nama) do nothing;

-- UNNES (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 53, 70, array[775,867,898], array[1198,1236,1319], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 689),
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 85, 111, array[1195,1280,1403], array[1836,1944,2115], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 676),
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 57, 69, array[817,871,917], array[1465,1508,1540], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 660),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 76, 86, array[943,978,1082], array[1362,1495,1536], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.4, 654),
  ('Pendidikan Fisika', 'Saintek', array['Fisika','Matematika'], 79, 99, array[897,943,1037], array[1265,1308,1410], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 659),
  ('Pendidikan Geografi', 'Soshum', array['Geografi'], 57, 95, array[675,737,802], array[1053,1100,1238], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.6, 636),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 54, 78, array[648,706,765], array[1219,1236,1337], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 655),
  ('Pendidikan Sejarah', 'Soshum', array['Sejarah Indonesia'], 79, 96, array[1013,1014,1134], array[1569,1697,1841], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.4, 659),
  ('Pendidikan Anak Usia Dini', 'Soshum', array['Bahasa Indonesia'], 90, 126, array[1068,1126,1221], array[1631,1770,1885], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 657),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 78, 97, array[882,981,1017], array[1516,1557,1643], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.2, 663)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNNES'
on conflict (ptn_id, nama) do nothing;

-- UNY (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 74, 84, array[931,995,1069], array[1529,1555,1655], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.5, 663),
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 44, 67, array[535,574,611], array[855,966,972], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 680),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 66, 102, array[1020,1050,1130], array[1318,1416,1518], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 662),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 62, 77, array[801,827,857], array[1075,1135,1217], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 650),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 79, 95, array[1013,1066,1144], array[1512,1539,1712], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84, 669),
  ('Pendidikan Anak Usia Dini', 'Soshum', array['Bahasa Indonesia'], 48, 67, array[525,573,626], array[723,771,865], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 657),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 73, 112, array[809,893,982], array[1200,1318,1351], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.1, 645),
  ('Pendidikan Fisika', 'Saintek', array['Fisika','Matematika'], 79, 104, array[997,1014,1116], array[1571,1628,1734], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 646),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 87, 99, array[1215,1322,1415], array[2007,2116,2264], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 660),
  ('Pendidikan Geografi', 'Soshum', array['Geografi'], 90, 105, array[1116,1148,1256], array[1965,2019,2135], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.6, 636)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNY'
on conflict (ptn_id, nama) do nothing;

-- UNS (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 88, 124, array[1182,1296,1331], array[1601,1781,1794], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 690),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 43, 72, array[588,625,681], array[1005,1118,1160], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 671),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 94, 115, array[1287,1358,1418], array[2008,2203,2394], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 705),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 93, 116, array[1325,1395,1463], array[2224,2402,2553], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.4, 688),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 47, 67, array[591,633,667], array[881,902,992], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 669),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 49, 69, array[606,664,703], array[967,960,1069], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 687),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 42, 75, array[504,520,546], array[786,815,891], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 671),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 54, 69, array[702,750,808], array[886,966,1040], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.3, 649),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 96, 130, array[1238,1346,1414], array[1806,1954,2056], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 676),
  ('Sastra Inggris', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 72, 90, array[818,873,955], array[1149,1228,1323], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 655)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNS'
on conflict (ptn_id, nama) do nothing;

-- UPI (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 66, 88, array[859,959,1004], array[1235,1377,1394], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.2, 670),
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 46, 83, array[593,614,655], array[946,991,1035], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 667),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 80, 103, array[1013,1066,1211], array[1424,1479,1565], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 674),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 72, 89, array[897,960,1051], array[1502,1611,1742], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 663),
  ('Pendidikan Biologi', 'Saintek', array['Biologi'], 70, 102, array[912,937,993], array[1636,1748,1811], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.3, 658),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 48, 86, array[673,712,780], array[973,969,1042], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 670),
  ('Pendidikan Anak Usia Dini', 'Soshum', array['Bahasa Indonesia'], 77, 104, array[850,934,1005], array[1240,1333,1502], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 658),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 90, 118, array[1025,1081,1173], array[1356,1396,1583], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.4, 638),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 96, 114, array[1180,1255,1369], array[1533,1598,1655], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 671),
  ('Pendidikan Geografi', 'Soshum', array['Geografi'], 45, 76, array[574,593,641], array[1020,1018,1143], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.1, 642)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UPI'
on conflict (ptn_id, nama) do nothing;

-- UNM (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 63, 98, array[884,914,1022], array[1203,1324,1347], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 680),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 98, 125, array[1285,1362,1449], array[2250,2448,2688], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 669),
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 84, 96, array[1203,1298,1320], array[1775,1879,1985], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 680),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 74, 105, array[970,1030,1108], array[1468,1646,1720], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 663),
  ('Pendidikan Ekonomi', 'Soshum', array['Ekonomi','Matematika'], 47, 57, array[577,612,642], array[912,964,1087], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.3, 643),
  ('Pendidikan Biologi', 'Saintek', array['Biologi'], 82, 122, array[924,944,1024], array[1392,1577,1639], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 660),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 56, 90, array[641,692,703], array[936,1026,1059], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.4, 667),
  ('Pendidikan Fisika', 'Saintek', array['Fisika','Matematika'], 65, 82, array[806,820,882], array[1458,1445,1624], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 667),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 52, 83, array[580,624,703], array[1088,1103,1236], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.4, 650),
  ('Pendidikan Geografi', 'Soshum', array['Geografi'], 91, 111, array[1037,1139,1212], array[1789,1873,1960], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.5, 651)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNM'
on conflict (ptn_id, nama) do nothing;

-- UNUD (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 60, 89, array[900,961,1004], array[1444,1514,1593], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 687),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 76, 112, array[1018,1074,1155], array[1554,1616,1779], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 694),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 73, 86, array[1068,1122,1223], array[1560,1735,1854], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 685),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 62, 85, array[859,916,1019], array[1577,1623,1761], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 687),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 68, 90, array[932,987,1090], array[1393,1417,1548], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 692),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 44, 71, array[598,635,672], array[928,999,1060], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 656),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 42, 57, array[552,574,612], array[815,874,928], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 651),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 58, 70, array[890,903,999], array[1478,1615,1721], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 693),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 67, 105, array[888,977,1033], array[1369,1440,1562], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 655),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 59, 96, array[657,702,786], array[1021,1112,1134], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 657)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNUD'
on conflict (ptn_id, nama) do nothing;

-- UNRAM (10 prodi)
insert into public.prodi (
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
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 90, 99, array[1376,1440,1529], array[2351,2416,2696], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.2, 669),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 75, 86, array[1190,1311,1410], array[2159,2290,2363], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 691),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 58, 80, array[846,908,1022], array[1166,1238,1314], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 702),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 64, 75, array[889,954,1039], array[1499,1543,1700], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 687),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 85, 105, array[1037,1106,1244], array[1466,1566,1556], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.7, 664),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 49, 75, array[685,742,802], array[1151,1159,1286], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 677),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 50, 77, array[704,727,788], array[1090,1159,1277], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 681),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 85, 94, array[1064,1165,1236], array[1404,1536,1630], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 670),
  ('Statistika', 'Saintek', array['Matematika'], 85, 107, array[946,1044,1091], array[1545,1636,1627], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 659),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 64, 82, array[748,807,838], array[1308,1337,1428], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.3, 653)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNRAM'
on conflict (ptn_id, nama) do nothing;

-- UNDIKSHA (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 94, 131, array[1258,1380,1457], array[1823,1948,2162], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 686),
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 53, 64, array[767,782,839], array[1056,1142,1169], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.2, 667),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 86, 117, array[1056,1113,1171], array[1843,1843,2051], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 659),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 54, 66, array[749,810,888], array[1053,1050,1111], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 652),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 89, 114, array[1049,1160,1258], array[1891,2021,2191], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 681),
  ('Pendidikan Anak Usia Dini', 'Soshum', array['Bahasa Indonesia'], 45, 76, array[551,601,617], array[855,908,973], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 658),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 64, 93, array[883,923,951], array[1236,1356,1462], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 662),
  ('Pendidikan Fisika', 'Saintek', array['Fisika','Matematika'], 70, 87, array[822,849,918], array[1116,1145,1296], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 659),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 92, 117, array[1129,1228,1335], array[1818,1812,1954], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 652),
  ('Pendidikan Biologi', 'Saintek', array['Biologi'], 50, 61, array[622,645,699], array[846,888,983], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.9, 640)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNDIKSHA'
on conflict (ptn_id, nama) do nothing;

-- UNIMA (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 67, 80, array[962,1027,1149], array[1495,1479,1599], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 683),
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 87, 110, array[1154,1191,1328], array[1951,2078,2165], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 663),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 83, 107, array[1215,1358,1381], array[1879,2001,1983], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.7, 688),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 74, 88, array[970,988,1083], array[1628,1789,1884], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 666),
  ('Pendidikan Ekonomi', 'Soshum', array['Ekonomi','Matematika'], 66, 96, array[825,883,982], array[1466,1564,1562], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 647),
  ('Pendidikan Biologi', 'Saintek', array['Biologi'], 43, 73, array[553,585,631], array[769,769,865], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 642),
  ('Pendidikan Anak Usia Dini', 'Soshum', array['Bahasa Indonesia'], 92, 105, array[1042,1131,1224], array[1371,1490,1507], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.9, 671),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 65, 86, array[821,879,950], array[1127,1235,1325], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.2, 644),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 41, 60, array[481,514,570], array[717,788,851], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 659),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 42, 78, array[555,628,676], array[815,913,952], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 677)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNIMA'
on conflict (ptn_id, nama) do nothing;

-- UNG (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 66, 94, array[800,881,935], array[1421,1519,1652], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 683),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 84, 103, array[1054,1158,1220], array[1855,2122,2261], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.4, 681),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 77, 116, array[965,1083,1162], array[1627,1759,1809], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 681),
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 53, 88, array[629,665,692], array[1028,1065,1123], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.2, 656),
  ('Pendidikan Biologi', 'Saintek', array['Biologi'], 90, 107, array[1019,1042,1181], array[1788,1961,1965], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 653),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 46, 66, array[532,575,611], array[742,766,818], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 678),
  ('Pendidikan Geografi', 'Soshum', array['Geografi'], 59, 76, array[681,713,774], array[1013,1155,1139], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.3, 636),
  ('Pendidikan Anak Usia Dini', 'Soshum', array['Bahasa Indonesia'], 76, 96, array[971,1086,1116], array[1601,1769,1949], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 675),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 67, 89, array[863,894,943], array[1429,1505,1606], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.5, 639),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 93, 120, array[1113,1154,1264], array[1818,1973,2016], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 667)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNG'
on conflict (ptn_id, nama) do nothing;

-- UNTAD (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 73, 103, array[967,972,1068], array[1602,1733,1780], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 691),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 82, 118, array[1075,1157,1282], array[1558,1594,1767], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 664),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 91, 102, array[1202,1269,1385], array[1824,1864,2056], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 683),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 41, 74, array[489,534,584], array[862,968,982], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 647),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 56, 73, array[685,751,808], array[1072,1076,1156], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 657),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 67, 75, array[895,957,1036], array[1279,1268,1415], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 665),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 67, 105, array[817,848,901], array[1274,1348,1415], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 682),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 73, 84, array[918,986,1057], array[1540,1595,1718], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.6, 653),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 93, 126, array[1304,1374,1458], array[1854,2115,2226], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 666),
  ('Matematika', 'Saintek', array['Matematika'], 81, 110, array[870,910,997], array[1319,1441,1500], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84, 652)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNTAD'
on conflict (ptn_id, nama) do nothing;

-- UNTAN (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 95, 135, array[1433,1454,1556], array[2285,2504,2742], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 675),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 51, 87, array[735,791,854], array[1222,1348,1448], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 702),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 88, 118, array[1209,1295,1470], array[1712,1778,1869], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 660),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 61, 84, array[913,994,1091], array[1292,1311,1462], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.3, 666),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 78, 105, array[950,1039,1092], array[1606,1627,1694], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 691),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 52, 79, array[655,682,751], array[1079,1221,1207], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 669),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 49, 66, array[618,658,705], array[949,1050,1047], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 684),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 87, 106, array[1184,1297,1331], array[2025,2162,2286], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 683),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 48, 72, array[644,652,729], array[1016,1126,1182], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 673),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 70, 93, array[937,1009,1029], array[1340,1442,1539], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 670)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNTAN'
on conflict (ptn_id, nama) do nothing;

-- ULM (10 prodi)
insert into public.prodi (
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
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 85, 119, array[1140,1238,1354], array[1729,1847,1996], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 691),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 55, 70, array[700,753,826], array[1265,1337,1454], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.2, 694),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 61, 70, array[943,1053,1136], array[1295,1433,1494], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 691),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 54, 90, array[789,823,873], array[1217,1322,1334], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 684),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 71, 101, array[972,1049,1122], array[1732,1907,1909], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 668),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 75, 114, array[940,1043,1067], array[1429,1535,1632], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 668),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 64, 90, array[746,811,900], array[1241,1251,1349], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 678),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 47, 66, array[621,657,697], array[1098,1109,1205], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 678),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 60, 87, array[788,832,910], array[1287,1378,1447], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 668),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 45, 59, array[596,608,656], array[808,879,968], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 648)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'ULM'
on conflict (ptn_id, nama) do nothing;

-- UNJ (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 95, 124, array[1321,1334,1474], array[2201,2252,2464], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 666),
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 46, 81, array[599,653,697], array[971,967,1036], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 689),
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 47, 71, array[562,612,616], array[985,1096,1129], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 674),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 47, 59, array[582,634,665], array[968,1005,1085], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 668),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 86, 98, array[1122,1216,1283], array[2037,2067,2278], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 666),
  ('Pendidikan Biologi', 'Saintek', array['Biologi'], 82, 113, array[932,975,1069], array[1478,1493,1668], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.2, 654),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 53, 62, array[729,786,833], array[1040,1074,1108], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 669),
  ('Pendidikan Fisika', 'Saintek', array['Fisika','Matematika'], 69, 93, array[796,872,903], array[1106,1155,1166], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.9, 663),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 69, 90, array[848,921,1004], array[1289,1345,1517], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.5, 668),
  ('Pendidikan Ekonomi', 'Soshum', array['Ekonomi','Matematika'], 44, 64, array[528,558,598], array[821,871,883], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 644)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNJ'
on conflict (ptn_id, nama) do nothing;

-- UNILA (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 86, 124, array[1144,1178,1245], array[1741,1793,1910], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 699),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 92, 108, array[1432,1572,1631], array[2461,2750,2801], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.8, 674),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 88, 113, array[1232,1315,1392], array[1993,2045,2251], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 670),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 89, 117, array[1206,1349,1454], array[2068,2092,2303], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 681),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 69, 92, array[875,954,997], array[1566,1666,1771], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 664),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 96, 126, array[1230,1311,1388], array[1720,1851,1936], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 657),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 57, 86, array[748,800,846], array[1060,1112,1135], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 670),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 42, 78, array[584,654,679], array[871,910,985], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 684),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 73, 103, array[945,1027,1131], array[1332,1409,1554], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 682),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 70, 107, array[823,837,929], array[1082,1171,1239], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 666)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNILA'
on conflict (ptn_id, nama) do nothing;

-- UNIB (10 prodi)
insert into public.prodi (
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
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 83, 109, array[1167,1198,1270], array[1561,1686,1712], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 663),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 59, 99, array[916,952,1004], array[1243,1300,1345], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88, 676),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 77, 97, array[1009,1090,1143], array[1475,1587,1680], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 703),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 62, 93, array[788,818,876], array[1348,1374,1451], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 678),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 53, 92, array[822,867,946], array[1445,1471,1566], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 690),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 91, 122, array[1120,1197,1259], array[1833,2060,2055], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 685),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 89, 112, array[1074,1121,1285], array[1441,1546,1579], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 677),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 42, 55, array[551,563,623], array[909,922,953], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 650),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 63, 77, array[828,888,900], array[1144,1160,1238], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.3, 674),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 60, 100, array[746,785,861], array[1020,1066,1166], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 676)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNIB'
on conflict (ptn_id, nama) do nothing;

-- UNJA (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 82, 93, array[1135,1231,1294], array[1539,1688,1847], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.5, 696),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 50, 78, array[714,749,792], array[1080,1102,1199], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 689),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 72, 104, array[1094,1166,1222], array[1886,1884,2086], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 679),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 55, 74, array[890,924,980], array[1171,1269,1321], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 688),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 81, 90, array[1086,1129,1175], array[1441,1496,1641], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.2, 663),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 68, 76, array[987,1047,1099], array[1665,1816,1922], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 676),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 97, 106, array[1231,1272,1326], array[1908,1968,2055], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 674),
  ('Statistika', 'Saintek', array['Matematika'], 84, 121, array[1074,1132,1196], array[1420,1559,1652], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.2, 647),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 53, 80, array[697,752,795], array[988,1090,1144], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 657),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 54, 84, array[733,803,852], array[1193,1241,1281], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 654)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNJA'
on conflict (ptn_id, nama) do nothing;

-- UNRI (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 49, 85, array[708,797,828], array[1069,1112,1208], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 684),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 60, 89, array[875,920,1017], array[1362,1502,1505], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 671),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 73, 104, array[954,1043,1125], array[1492,1592,1726], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 693),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 78, 94, array[1217,1271,1319], array[2187,2297,2340], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 677),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 65, 96, array[872,895,992], array[1182,1284,1350], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 657),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 96, 108, array[1172,1255,1346], array[1823,1991,2023], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 677),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 65, 103, array[923,939,1037], array[1581,1752,1851], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 683),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 49, 87, array[646,684,709], array[910,994,1032], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 658),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 77, 94, array[939,987,1130], array[1366,1507,1539], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 659),
  ('Administrasi Publik', 'Soshum', array['PPKn','Bahasa Indonesia'], 40, 72, array[416,448,485], array[799,820,863], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.9, 640)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNRI'
on conflict (ptn_id, nama) do nothing;

-- UNSRI (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 50, 73, array[708,739,808], array[1208,1302,1429], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88, 691),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 85, 97, array[1113,1198,1281], array[1490,1548,1673], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 665),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 92, 103, array[1195,1347,1413], array[1800,1887,2039], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 671),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 71, 108, array[1019,1034,1096], array[1330,1520,1522], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.2, 696),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 80, 104, array[1017,1096,1239], array[1805,1999,2105], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 700),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 85, 121, array[1173,1280,1346], array[1590,1730,1843], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 658),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 81, 112, array[1004,1100,1185], array[1711,1817,1836], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 673),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 64, 81, array[843,857,944], array[1098,1213,1279], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 669),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 50, 62, array[707,736,794], array[1027,1053,1137], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 669),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 88, 100, array[1249,1383,1488], array[1810,1964,2135], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 685)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNSRI'
on conflict (ptn_id, nama) do nothing;

-- UBB (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 56, 64, array[856,916,1033], array[1556,1586,1766], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 698),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 70, 94, array[974,1040,1106], array[1425,1564,1612], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.5, 687),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 72, 97, array[960,1006,1065], array[1292,1396,1396], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 666),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 66, 98, array[898,958,1073], array[1185,1318,1379], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 694),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 94, 114, array[1210,1325,1403], array[1833,2007,2162], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 650),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 97, 121, array[1319,1339,1474], array[2340,2367,2628], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 661),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 58, 85, array[807,876,931], array[1516,1567,1598], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.6, 676),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 90, 112, array[1262,1347,1383], array[2041,2062,2173], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 672),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 64, 81, array[781,795,861], array[1266,1267,1377], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 673),
  ('Statistika', 'Saintek', array['Matematika'], 40, 57, array[430,455,500], array[702,727,776], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.6, 662)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UBB'
on conflict (ptn_id, nama) do nothing;

-- UNTIRTA (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 67, 92, array[897,938,1049], array[1439,1505,1553], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 697),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 61, 80, array[769,789,849], array[1249,1412,1448], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 676),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 78, 96, array[1121,1152,1249], array[1896,1998,2239], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 665),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 68, 90, array[1064,1091,1169], array[1710,1914,1998], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 693),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 87, 101, array[1267,1394,1510], array[2150,2189,2485], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 666),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 48, 81, array[582,627,688], array[1000,1062,1125], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 663),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 47, 82, array[619,647,687], array[779,864,879], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.4, 650),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 52, 74, array[634,681,752], array[1119,1197,1218], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 665),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 65, 92, array[828,891,991], array[1131,1222,1323], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 657),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 77, 90, array[963,1069,1170], array[1397,1494,1670], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 654)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNTIRTA'
on conflict (ptn_id, nama) do nothing;

-- UNSOED (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 47, 62, array[601,652,662], array[900,937,997], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 684),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 77, 87, array[1235,1348,1440], array[1945,2051,2134], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 671),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 47, 84, array[611,676,700], array[981,994,1076], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 682),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 97, 115, array[1239,1321,1426], array[2145,2195,2376], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.5, 667),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 46, 55, array[556,610,656], array[1003,1069,1121], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85, 684),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 47, 82, array[674,680,740], array[1092,1192,1292], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 681),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 95, 131, array[1136,1211,1231], array[1808,1824,1982], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 657),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 57, 73, array[628,685,730], array[891,943,1021], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.3, 678),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 45, 62, array[567,607,644], array[814,877,888], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 681),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 80, 118, array[1181,1236,1341], array[1613,1832,1878], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 662)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNSOED'
on conflict (ptn_id, nama) do nothing;

-- UNEJ (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 49, 60, array[755,810,896], array[1280,1289,1458], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 698),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 74, 96, array[1157,1264,1370], array[1967,2154,2224], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 681),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 96, 128, array[1419,1476,1537], array[2155,2250,2490], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 694),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 45, 60, array[654,689,718], array[912,991,1029], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.1, 691),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 86, 124, array[1116,1208,1234], array[1578,1722,1796], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 676),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 60, 91, array[864,877,953], array[1439,1450,1598], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 664),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 61, 86, array[801,863,894], array[1341,1374,1515], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 670),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 68, 97, array[856,890,988], array[1332,1479,1548], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 659),
  ('Sastra Inggris', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 70, 82, array[912,956,1041], array[1341,1459,1532], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 651),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 62, 70, array[803,849,892], array[1400,1541,1633], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 675)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNEJ'
on conflict (ptn_id, nama) do nothing;

-- UNSYIAH (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 68, 94, array[882,915,1011], array[1569,1648,1680], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 683),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 52, 83, array[797,841,903], array[1293,1441,1521], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.7, 695),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 48, 86, array[681,723,778], array[1270,1294,1420], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 692),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 93, 124, array[1518,1613,1781], array[2263,2443,2639], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.6, 704),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 70, 94, array[879,943,1056], array[1471,1580,1683], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 662),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 69, 99, array[1023,1104,1225], array[1751,1869,2023], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 674),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 92, 121, array[1200,1254,1367], array[1851,1881,2047], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 667),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 93, 113, array[1261,1378,1503], array[2087,2148,2329], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 652),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 57, 78, array[817,899,951], array[1409,1427,1556], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 670),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 72, 102, array[900,989,1045], array[1283,1443,1526], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 678)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNSYIAH'
on conflict (ptn_id, nama) do nothing;

-- UNIMED (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 77, 101, array[897,978,1039], array[1580,1661,1766], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 680),
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 70, 86, array[951,963,1087], array[1576,1663,1765], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.5, 683),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 75, 108, array[1102,1149,1252], array[1591,1666,1846], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.7, 658),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 85, 99, array[1090,1128,1227], array[1572,1663,1702], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 654),
  ('Pendidikan Anak Usia Dini', 'Soshum', array['Bahasa Indonesia'], 72, 108, array[800,881,955], array[1130,1214,1245], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 656),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 61, 81, array[774,799,886], array[1350,1413,1479], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 669),
  ('Pendidikan Biologi', 'Saintek', array['Biologi'], 67, 97, array[853,903,1013], array[1103,1245,1342], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 658),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 70, 84, array[875,940,997], array[1175,1308,1355], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 673),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 93, 117, array[1109,1152,1222], array[1629,1744,1882], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 644),
  ('Pendidikan Fisika', 'Saintek', array['Fisika','Matematika'], 53, 64, array[593,633,654], array[763,868,870], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 658)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNIMED'
on conflict (ptn_id, nama) do nothing;

-- USU (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 56, 89, array[744,771,851], array[1319,1328,1450], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 693),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 98, 112, array[1364,1492,1582], array[2073,2067,2215], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 691),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 66, 85, array[972,1008,1072], array[1714,1761,1909], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.8, 679),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 96, 115, array[1484,1498,1669], array[2255,2315,2438], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.1, 670),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 42, 62, array[617,647,695], array[975,1015,1118], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 676),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 48, 70, array[663,669,736], array[893,951,1001], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 664),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 93, 101, array[1321,1446,1584], array[1980,2042,2241], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 678),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 80, 101, array[952,1018,1087], array[1247,1424,1448], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 667),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 59, 90, array[751,805,886], array[1279,1332,1377], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.1, 678),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 53, 80, array[775,799,840], array[1013,1055,1174], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 677)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'USU'
on conflict (ptn_id, nama) do nothing;

-- UNP (10 prodi)
insert into public.prodi (
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
  ('Pendidikan Matematika', 'Soshum', array['Matematika'], 43, 83, array[570,577,621], array[1006,1055,1061], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 663),
  ('Pendidikan Bahasa Indonesia', 'Soshum', array['Bahasa Indonesia'], 43, 76, array[546,582,597], array[733,776,796], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 666),
  ('Pendidikan Guru Sekolah Dasar', 'Soshum', array['Bahasa Indonesia','Matematika'], 67, 102, array[940,1004,1030], array[1493,1524,1669], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 670),
  ('Pendidikan Bahasa Inggris', 'Soshum', array['Bahasa Inggris'], 94, 129, array[1155,1188,1321], array[1560,1737,1775], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 686),
  ('Bimbingan dan Konseling', 'Soshum', array['Bahasa Indonesia','PPKn'], 87, 125, array[1078,1140,1209], array[1550,1669,1780], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 678),
  ('Pendidikan Biologi', 'Saintek', array['Biologi'], 79, 104, array[938,983,1004], array[1630,1669,1858], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 648),
  ('Pendidikan Fisika', 'Saintek', array['Fisika','Matematika'], 94, 127, array[1158,1258,1340], array[1673,1784,1885], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.1, 639),
  ('Pendidikan Kimia', 'Saintek', array['Kimia','Matematika'], 54, 69, array[606,662,720], array[966,998,1049], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 648),
  ('Pendidikan Ekonomi', 'Soshum', array['Ekonomi','Matematika'], 74, 106, array[873,900,943], array[1105,1229,1311], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 639),
  ('Pendidikan Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 59, 91, array[775,809,869], array[1327,1469,1533], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 650)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNP'
on conflict (ptn_id, nama) do nothing;

-- UNTIDAR (10 prodi)
insert into public.prodi (
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
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 70, 105, array[829,904,962], array[1570,1600,1728], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 685),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 86, 94, array[1235,1378,1504], array[1902,2009,2134], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.5, 698),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 72, 96, array[876,956,980], array[1522,1506,1659], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 692),
  ('Akuntansi', 'Soshum', array['Matematika','Ekonomi'], 92, 119, array[1131,1201,1266], array[1770,1846,1932], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 679),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 79, 95, array[965,1033,1067], array[1349,1512,1532], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 673),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 45, 64, array[656,713,797], array[893,976,1017], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 665),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 93, 103, array[1194,1269,1374], array[2060,2091,2235], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 658),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 42, 54, array[491,525,567], array[615,685,712], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.8, 669),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 95, 117, array[1250,1355,1432], array[1700,1936,2051], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 666),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 42, 66, array[570,585,637], array[879,929,961], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 676)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNTIDAR'
on conflict (ptn_id, nama) do nothing;

-- UHO (10 prodi)
insert into public.prodi (
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
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 97, 110, array[1232,1324,1403], array[2185,2217,2293], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 698),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 82, 108, array[1064,1116,1222], array[1925,1909,2089], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 678),
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 85, 119, array[1230,1357,1388], array[1555,1758,1882], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.7, 701),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 77, 111, array[1158,1212,1336], array[1708,1845,1921], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 689),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 50, 62, array[769,813,854], array[1217,1261,1331], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 688),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 55, 77, array[815,872,927], array[1310,1318,1393], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.8, 693),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 54, 79, array[715,740,799], array[1129,1278,1286], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 663),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 88, 114, array[1109,1145,1224], array[1844,1918,2095], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 648),
  ('Ilmu Komunikasi', 'Soshum', array['Bahasa Indonesia','Bahasa Inggris'], 88, 97, array[1025,1140,1237], array[1488,1540,1611], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 687),
  ('Statistika', 'Saintek', array['Matematika'], 62, 96, array[776,837,891], array[1215,1295,1374], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 657)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UHO'
on conflict (ptn_id, nama) do nothing;

-- UNPATTI (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 73, 102, array[1049,1107,1180], array[1494,1552,1620], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 688),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 86, 119, array[1270,1373,1421], array[1862,1977,2002], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 679),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 56, 90, array[854,899,958], array[1169,1287,1292], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 692),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 67, 87, array[896,993,1065], array[1342,1442,1527], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.5, 685),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 61, 79, array[792,866,891], array[1042,1145,1241], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 689),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 82, 121, array[1157,1174,1307], array[1801,1964,2093], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 680),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 45, 66, array[601,658,705], array[947,1017,1060], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 666),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 88, 114, array[1041,1088,1151], array[1396,1389,1545], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 675),
  ('Ilmu Ekonomi', 'Soshum', array['Matematika','Ekonomi'], 79, 89, array[1047,1157,1183], array[1649,1666,1823], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.8, 670),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 44, 58, array[580,613,685], array[1012,1020,1137], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 648)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNPATTI'
on conflict (ptn_id, nama) do nothing;

-- UNCEN (10 prodi)
insert into public.prodi (
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
  ('Kedokteran', 'Saintek', array['Biologi','Kimia'], 94, 124, array[1280,1332,1479], array[1919,1969,2187], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.1, 687),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 43, 76, array[569,619,655], array[890,929,969], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 668),
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 90, 106, array[1261,1336,1519], array[2099,2225,2349], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 702),
  ('Kedokteran Gigi', 'Saintek', array['Biologi','Kimia'], 88, 102, array[1236,1285,1380], array[1718,1888,2013], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 683),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 64, 94, array[955,1017,1049], array[1524,1632,1766], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.9, 665),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 55, 66, array[773,824,856], array[1086,1142,1211], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 665),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 79, 113, array[1121,1205,1310], array[1534,1631,1863], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 677),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 44, 81, array[547,601,611], array[816,867,931], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 679),
  ('Sastra Inggris', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 46, 66, array[580,606,627], array[730,825,835], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 658),
  ('Farmasi', 'Saintek', array['Kimia','Biologi'], 53, 67, array[789,829,893], array[1277,1364,1519], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 680)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UNCEN'
on conflict (ptn_id, nama) do nothing;

-- ITERA (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 64, 86, array[896,931,1053], array[1251,1305,1456], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 688),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 82, 106, array[1140,1256,1326], array[1881,2022,2047], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 684),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 94, 129, array[1182,1255,1319], array[2060,2268,2298], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 674),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 58, 92, array[756,801,895], array[1129,1181,1308], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 661),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 84, 108, array[1007,1072,1113], array[1417,1425,1553], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.7, 670),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 86, 116, array[1157,1261,1348], array[1778,2004,1997], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 671),
  ('Sistem Informasi', 'Saintek', array['Matematika','Fisika'], 47, 68, array[616,658,739], array[890,948,974], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 686),
  ('Teknik Material', 'Saintek', array['Fisika','Kimia'], 40, 63, array[493,549,583], array[759,775,849], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.1, 645),
  ('Teknik Geodesi', 'Saintek', array['Matematika','Fisika'], 61, 98, array[672,709,788], array[857,932,953], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 82.8, 660),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 47, 57, array[624,683,707], array[999,1127,1139], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 648)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'ITERA'
on conflict (ptn_id, nama) do nothing;

-- ITK (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 98, 120, array[1434,1542,1611], array[2493,2590,2643], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 701),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 63, 73, array[935,977,1029], array[1526,1665,1722], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 676),
  ('Teknik Mesin', 'Saintek', array['Matematika','Fisika'], 68, 104, array[892,933,986], array[1248,1357,1428], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.9, 669),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 66, 104, array[863,924,1010], array[1412,1595,1649], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 663),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 92, 115, array[1150,1256,1311], array[1684,1870,1974], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 680),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 54, 64, array[728,797,859], array[1184,1191,1302], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 676),
  ('Teknik Lingkungan', 'Saintek', array['Matematika','Fisika'], 65, 74, array[743,769,868], array[1169,1241,1337], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 634),
  ('Sistem Informasi', 'Saintek', array['Matematika','Fisika'], 95, 112, array[1205,1279,1430], array[2239,2341,2391], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.6, 674),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 62, 92, array[744,798,880], array[1321,1397,1519], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.3, 657),
  ('Teknik Pertambangan', 'Saintek', array['Matematika','Fisika'], 81, 99, array[985,1057,1165], array[1800,1961,2057], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 663)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'ITK'
on conflict (ptn_id, nama) do nothing;

-- PNJ (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Sipil', 'Vokasi', array['Matematika','Fisika'], 61, 92, array[840,890,936], array[1459,1457,1578], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 651),
  ('D4 Teknik Mesin', 'Vokasi', array['Matematika','Fisika'], 71, 89, array[929,960,1073], array[1197,1309,1356], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.5, 660),
  ('D4 Manajemen Pemasaran', 'Vokasi', array['Matematika','Ekonomi'], 48, 73, array[660,673,763], array[994,1076,1124], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.2, 657),
  ('D4 Administrasi Bisnis', 'Vokasi', array['Matematika','Ekonomi'], 46, 63, array[566,580,652], array[895,918,970], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 662),
  ('D4 Akuntansi', 'Vokasi', array['Matematika','Ekonomi'], 60, 88, array[706,730,823], array[908,955,1067], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 665),
  ('D4 Teknik Kimia', 'Vokasi', array['Kimia','Matematika'], 83, 107, array[968,1052,1093], array[1446,1656,1681], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.5, 637),
  ('D4 Teknik Otomotif', 'Vokasi', array['Matematika','Fisika'], 71, 100, array[840,891,958], array[1157,1185,1253], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 668),
  ('D4 Teknik Informatika', 'Vokasi', array['Matematika','Fisika'], 51, 63, array[719,800,871], array[1111,1136,1179], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88, 686),
  ('D4 Teknik Elektro', 'Vokasi', array['Matematika','Fisika'], 62, 88, array[832,876,906], array[1072,1133,1210], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 673),
  ('D4 Teknik Telekomunikasi', 'Vokasi', array['Matematika','Fisika'], 74, 84, array[815,880,929], array[1049,1168,1207], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.6, 658)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'PNJ'
on conflict (ptn_id, nama) do nothing;

-- POLBAN (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Informatika', 'Vokasi', array['Matematika','Fisika'], 36, 58, array[498,521,554], array[768,807,865], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 673),
  ('D4 Akuntansi', 'Vokasi', array['Matematika','Ekonomi'], 82, 97, array[984,1009,1062], array[1602,1642,1728], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 653),
  ('D4 Teknik Mesin', 'Vokasi', array['Matematika','Fisika'], 71, 110, array[800,847,905], array[1392,1430,1558], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 660),
  ('D4 Teknik Sipil', 'Vokasi', array['Matematika','Fisika'], 68, 84, array[871,973,999], array[1488,1692,1677], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 662),
  ('D4 Teknik Kimia', 'Vokasi', array['Kimia','Matematika'], 38, 47, array[436,461,502], array[639,657,700], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 666),
  ('D4 Teknik Telekomunikasi', 'Vokasi', array['Matematika','Fisika'], 39, 54, array[420,476,515], array[755,758,824], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 663),
  ('D4 Administrasi Bisnis', 'Vokasi', array['Matematika','Ekonomi'], 38, 57, array[518,554,596], array[883,880,982], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 678),
  ('D4 Teknik Otomotif', 'Vokasi', array['Matematika','Fisika'], 84, 98, array[988,1098,1164], array[1412,1480,1648], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.3, 662),
  ('D4 Manajemen Pemasaran', 'Vokasi', array['Matematika','Ekonomi'], 52, 63, array[713,752,793], array[916,1003,1019], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 658),
  ('D4 Teknik Elektro', 'Vokasi', array['Matematika','Fisika'], 76, 88, array[898,956,991], array[1383,1459,1532], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.4, 658)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'POLBAN'
on conflict (ptn_id, nama) do nothing;

-- POLINES (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Otomotif', 'Vokasi', array['Matematika','Fisika'], 47, 66, array[591,611,673], array[834,923,975], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 652),
  ('D4 Teknik Telekomunikasi', 'Vokasi', array['Matematika','Fisika'], 61, 89, array[768,818,905], array[1197,1307,1374], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 641),
  ('D4 Administrasi Bisnis', 'Vokasi', array['Matematika','Ekonomi'], 40, 65, array[486,518,563], array[698,765,765], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.9, 649),
  ('D4 Teknik Informatika', 'Vokasi', array['Matematika','Fisika'], 79, 97, array[1055,1109,1166], array[1534,1681,1727], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 669),
  ('D4 Teknik Elektro', 'Vokasi', array['Matematika','Fisika'], 63, 82, array[799,838,869], array[1334,1500,1596], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 676),
  ('D4 Manajemen Pemasaran', 'Vokasi', array['Matematika','Ekonomi'], 38, 65, array[476,506,544], array[832,930,989], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 83.9, 644),
  ('D4 Teknik Sipil', 'Vokasi', array['Matematika','Fisika'], 84, 119, array[1087,1173,1273], array[1706,1940,2005], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 675),
  ('D4 Akuntansi', 'Vokasi', array['Matematika','Ekonomi'], 56, 71, array[703,770,782], array[1216,1335,1370], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.1, 663),
  ('D4 Teknik Mesin', 'Vokasi', array['Matematika','Fisika'], 48, 59, array[586,641,678], array[1084,1147,1170], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.3, 645),
  ('D4 Teknik Kimia', 'Vokasi', array['Kimia','Matematika'], 51, 60, array[562,598,671], array[784,805,867], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.6, 668)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'POLINES'
on conflict (ptn_id, nama) do nothing;

-- PENS (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Informatika', 'Vokasi', array['Matematika','Fisika'], 52, 92, array[725,770,814], array[1065,1107,1148], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 686),
  ('D4 Akuntansi', 'Vokasi', array['Matematika','Ekonomi'], 60, 81, array[731,771,800], array[1051,1106,1219], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 681),
  ('D4 Teknik Sipil', 'Vokasi', array['Matematika','Fisika'], 38, 77, array[440,479,528], array[817,839,909], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 671),
  ('D4 Manajemen Pemasaran', 'Vokasi', array['Matematika','Ekonomi'], 53, 66, array[705,740,824], array[1280,1385,1388], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.5, 657),
  ('D4 Teknik Mesin', 'Vokasi', array['Matematika','Fisika'], 77, 102, array[849,945,996], array[1632,1655,1782], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 644),
  ('D4 Teknik Otomotif', 'Vokasi', array['Matematika','Fisika'], 69, 80, array[804,860,906], array[1159,1229,1271], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.7, 658),
  ('D4 Administrasi Bisnis', 'Vokasi', array['Matematika','Ekonomi'], 51, 84, array[688,732,778], array[1085,1147,1217], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87, 660),
  ('D4 Teknik Elektro', 'Vokasi', array['Matematika','Fisika'], 84, 108, array[980,1065,1115], array[1541,1666,1801], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.7, 659),
  ('D4 Teknik Kimia', 'Vokasi', array['Kimia','Matematika'], 39, 55, array[486,526,554], array[624,703,705], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.3, 634),
  ('D4 Teknik Telekomunikasi', 'Vokasi', array['Matematika','Fisika'], 74, 109, array[908,935,1017], array[1619,1687,1807], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.5, 657)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'PENS'
on conflict (ptn_id, nama) do nothing;

-- POLINEMA (10 prodi)
insert into public.prodi (
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
  ('D4 Teknik Informatika', 'Vokasi', array['Matematika','Fisika'], 53, 80, array[721,796,812], array[1288,1435,1432], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.4, 686),
  ('D4 Manajemen Pemasaran', 'Vokasi', array['Matematika','Ekonomi'], 56, 77, array[637,705,744], array[942,940,1007], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.8, 656),
  ('D4 Administrasi Bisnis', 'Vokasi', array['Matematika','Ekonomi'], 38, 46, array[516,538,591], array[728,757,857], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.6, 657),
  ('D4 Teknik Mesin', 'Vokasi', array['Matematika','Fisika'], 57, 83, array[654,678,749], array[1141,1241,1273], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.5, 646),
  ('D4 Teknik Elektro', 'Vokasi', array['Matematika','Fisika'], 40, 61, array[457,490,529], array[793,866,914], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.4, 658),
  ('D4 Akuntansi', 'Vokasi', array['Matematika','Ekonomi'], 40, 69, array[488,538,557], array[809,863,976], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.3, 660),
  ('D4 Teknik Kimia', 'Vokasi', array['Kimia','Matematika'], 39, 52, array[446,482,504], array[725,764,805], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.1, 635),
  ('D4 Teknik Telekomunikasi', 'Vokasi', array['Matematika','Fisika'], 42, 67, array[503,513,553], array[804,863,920], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 84.4, 645),
  ('D4 Teknik Sipil', 'Vokasi', array['Matematika','Fisika'], 48, 64, array[587,599,661], array[888,1012,1067], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 653),
  ('D4 Teknik Otomotif', 'Vokasi', array['Matematika','Fisika'], 56, 70, array[625,665,736], array[961,1019,1127], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.7, 648)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'POLINEMA'
on conflict (ptn_id, nama) do nothing;

-- UPR (10 prodi)
insert into public.prodi (
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
  ('Teknik Informatika', 'Saintek', array['Matematika','Fisika'], 92, 107, array[1229,1262,1359], array[1743,1818,1968], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 88.1, 695),
  ('Ilmu Hukum', 'Soshum', array['PPKn','Bahasa Indonesia'], 72, 96, array[1021,1103,1193], array[1453,1638,1668], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.9, 665),
  ('Manajemen', 'Soshum', array['Matematika','Ekonomi'], 93, 123, array[1138,1267,1288], array[1503,1558,1744], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.1, 670),
  ('Hubungan Internasional', 'Soshum', array['Bahasa Inggris','Bahasa Indonesia'], 69, 98, array[1028,1109,1137], array[1764,1928,1991], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.8, 659),
  ('Psikologi', 'Soshum', array['Matematika','Bahasa Indonesia'], 71, 101, array[920,993,1111], array[1644,1827,1874], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86, 679),
  ('Teknik Elektro', 'Saintek', array['Matematika','Fisika'], 65, 89, array[877,963,1042], array[1551,1703,1772], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 87.2, 672),
  ('Arsitektur', 'Saintek', array['Matematika','Fisika'], 44, 71, array[540,577,616], array[865,925,1029], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 85.4, 666),
  ('Teknik Industri', 'Saintek', array['Matematika','Fisika'], 90, 122, array[1264,1412,1473], array[1940,2022,2205], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 675),
  ('Teknik Kimia', 'Saintek', array['Kimia','Matematika'], 57, 93, array[781,789,885], array[1366,1407,1498], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.1, 657),
  ('Teknik Sipil', 'Saintek', array['Matematika','Fisika'], 43, 60, array[555,584,637], array[881,900,961], '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb, 86.8, 687)
) as v(nama, rumpun, mapel, dsnbp, dsnbt, psnbp, psnbt, bobot, medsnbp, medsnbt)
where p.singkatan = 'UPR'
on conflict (ptn_id, nama) do nothing;

commit;

-- Cek hasil:
-- select count(*) as total_prodi from public.prodi;
-- select count(*) as total_ptn from public.ptn;
