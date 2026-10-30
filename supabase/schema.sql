-- ================================================================
-- MANTRA — SUPABASE SCHEMA
-- Tempel seluruh file ini di Supabase → SQL Editor → Run.
-- Aman dijalankan ulang (idempotent) untuk tabel & view.
-- ================================================================

create extension if not exists pgcrypto;

-- ----------------------------------------------------------------
-- 1. SEKOLAH
-- ----------------------------------------------------------------
create table if not exists public.sekolah (
  id uuid primary key default gen_random_uuid(),
  npsn text unique,
  nama text not null,
  jenjang text not null default 'SMA',
  akreditasi text not null default 'A',
  created_at timestamptz not null default now()
);

-- ----------------------------------------------------------------
-- 2. PTN
-- ----------------------------------------------------------------
create table if not exists public.ptn (
  id uuid primary key default gen_random_uuid(),
  nama text not null,
  singkatan text not null unique,
  kota text,
  created_at timestamptz not null default now()
);

-- ----------------------------------------------------------------
-- 3. PRODI
-- ----------------------------------------------------------------
create table if not exists public.prodi (
  id uuid primary key default gen_random_uuid(),
  ptn_id uuid not null references public.ptn(id) on delete cascade,
  nama text not null,
  rumpun text,
  mapel_pendukung text[] not null default '{}',
  daya_tampung_snbp integer not null default 40,
  daya_tampung_snbt integer not null default 60,
  peminat_snbp_historis integer[] not null default '{}',
  peminat_snbt_historis integer[] not null default '{}',
  bobot_snbp jsonb not null default
    '{"rapor_umum":0.5,"mapel_pendukung":0.3,"prestasi":0.1,"tka":0.1}'::jsonb,
  median_snbp numeric(6,2),
  median_snbt numeric(6,2),
  created_at timestamptz not null default now(),
  unique (ptn_id, nama)
);

-- ----------------------------------------------------------------
-- 4. SISWA
-- ----------------------------------------------------------------
create table if not exists public.siswa (
  id uuid primary key default gen_random_uuid(),
  nama text not null,
  kelas text,
  sekolah_id uuid references public.sekolah(id) on delete set null,
  peringkat_kelas_paralel integer,
  jumlah_siswa_eligible integer,
  skor_tka numeric(6,2),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ----------------------------------------------------------------
-- 5. NILAI RAPOR
-- ----------------------------------------------------------------
create table if not exists public.nilai_rapor (
  id uuid primary key default gen_random_uuid(),
  siswa_id uuid not null references public.siswa(id) on delete cascade,
  semester integer not null check (semester between 1 and 5),
  mapel text not null,
  nilai numeric(5,2) not null check (nilai between 0 and 100),
  created_at timestamptz not null default now(),
  unique (siswa_id, semester, mapel)
);

-- ----------------------------------------------------------------
-- 6. PRESTASI
-- ----------------------------------------------------------------
create table if not exists public.prestasi (
  id uuid primary key default gen_random_uuid(),
  siswa_id uuid not null references public.siswa(id) on delete cascade,
  nama text not null,
  level text not null default 'kabkota',
  peringkat integer,
  bidang text,
  relevan_prodi boolean not null default false,
  tahun integer,
  created_at timestamptz not null default now()
);

-- ----------------------------------------------------------------
-- 7. PILIHAN SISWA
-- ----------------------------------------------------------------
create table if not exists public.pilihan_siswa (
  id uuid primary key default gen_random_uuid(),
  siswa_id uuid not null references public.siswa(id) on delete cascade,
  prodi_id uuid not null references public.prodi(id) on delete cascade,
  jalur text not null check (jalur in ('SNBP', 'SNBT')),
  urutan integer not null check (urutan between 1 and 4),
  created_at timestamptz not null default now(),
  unique (siswa_id, jalur, urutan)
);

-- ----------------------------------------------------------------
-- 8. HASIL PREDIKSI
-- ----------------------------------------------------------------
create table if not exists public.hasil_prediksi (
  id uuid primary key default gen_random_uuid(),
  siswa_id uuid not null references public.siswa(id) on delete cascade,
  jalur text not null check (jalur in ('SNBP', 'SNBT')),
  probabilitas_total numeric(5,2) check (
    probabilitas_total between 0 and 1
  ),
  pilihan jsonb not null default '[]'::jsonb,
  model_version text,
  data_vintage integer,
  created_at timestamptz not null default now()
);

-- ----------------------------------------------------------------
-- 9. CHAT PESAN
-- ----------------------------------------------------------------
create table if not exists public.chat_pesan (
  id uuid primary key default gen_random_uuid(),
  siswa_id uuid references public.siswa(id) on delete set null,
  role text not null check (role in ('user', 'assistant')),
  isi text not null,
  created_at timestamptz not null default now()
);

-- ----------------------------------------------------------------
-- VIEW PRODI LENGKAP (dipakai komponen ProdiSearch)
-- ----------------------------------------------------------------
create or replace view public.prodi_lengkap as
select
  p.id,
  p.nama as prodi,
  pt.nama as universitas,
  pt.singkatan,
  p.rumpun,
  p.mapel_pendukung,
  p.daya_tampung_snbp,
  p.daya_tampung_snbt,
  p.peminat_snbp_historis,
  p.peminat_snbt_historis,
  p.median_snbp,
  p.median_snbt
from public.prodi p
join public.ptn pt on pt.id = p.ptn_id;

-- ----------------------------------------------------------------
-- INDEX
-- ----------------------------------------------------------------
create index if not exists idx_prodi_ptn on public.prodi(ptn_id);
create index if not exists idx_siswa_sekolah on public.siswa(sekolah_id);
create index if not exists idx_rapor_siswa on public.nilai_rapor(siswa_id);
create index if not exists idx_prestasi_siswa on public.prestasi(siswa_id);
create index if not exists idx_pilihan_siswa on public.pilihan_siswa(siswa_id, jalur);

-- ----------------------------------------------------------------
-- TRIGGER updated_at
-- ----------------------------------------------------------------
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_siswa_updated_at on public.siswa;
create trigger trg_siswa_updated_at
before update on public.siswa
for each row execute function public.set_updated_at();

-- ----------------------------------------------------------------
-- DEVELOPMENT: RLS dimatikan (sesuai brief).
-- JANGAN pakai konfigurasi ini untuk produksi publik.
-- ----------------------------------------------------------------
alter table public.sekolah disable row level security;
alter table public.ptn disable row level security;
alter table public.prodi disable row level security;
alter table public.siswa disable row level security;
alter table public.nilai_rapor disable row level security;
alter table public.prestasi disable row level security;
alter table public.pilihan_siswa disable row level security;
alter table public.hasil_prediksi disable row level security;
alter table public.chat_pesan disable row level security;

-- ----------------------------------------------------------------
-- GRANT untuk anon key (dipakai browser)
-- ----------------------------------------------------------------
grant usage on schema public to anon, authenticated;
grant select, insert, update, delete on all tables in schema public
  to anon, authenticated;
grant usage, select on all sequences in schema public
  to anon, authenticated;
grant select on public.prodi_lengkap to anon, authenticated;

alter default privileges in schema public
  grant select, insert, update, delete on tables to anon, authenticated;
