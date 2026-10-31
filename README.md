# MANTRA

**Manajemen Akademik & Navigasi Tekanan** — aplikasi web untuk memperkirakan peluang lolos SNBP/SNBT siswa SMA, dilengkapi pendamping kesehatan mental.

> MANTRA adalah estimator probabilistik, bukan oracle. Semua hasil prediksi wajib dibaca bersama confidence interval dan disclaimer.

**Live demo:** [mantra-app-gules.vercel.app](https://mantra-app-gules.vercel.app)

## Fitur

- **Data Diri** — profil siswa, sekolah, akreditasi, peringkat kelas, nilai TKA opsional, dan target prodi.
- **Rapor** — input nilai 5 semester untuk banyak mapel sekaligus.
- **Prestasi** — input lomba, tingkat, peringkat, dan relevansi dengan prodi.
- **Prediksi SNBP** — skor komposit dari rapor, mapel pendukung, prestasi, TKA, tren, konsistensi, dan indeks sekolah.
- **Prediksi SNBT** — input 7 subtes UTBK, pilih 1–4 prodi, lihat peluang tiap pilihan.
- **MANTRA Care** — chat AI (Groq) untuk mendengarkan dan membantu mengelola stres akademik, dengan pengingat krisis.
- **Mobile-first dark mode** dengan aksen pink `#ff2d55`.

## Stack

- Next.js 16 (App Router) + TypeScript
- Tailwind CSS v4 + shadcn/ui (Base UI, preset Nova)
- Supabase (PostgreSQL)
- Groq API (`openai/gpt-oss-120b`, fallback `openai/gpt-oss-20b`)
- Vercel

## Setup Lokal

```bash
git clone https://github.com/aitenanbjir-netizen/mantra-app.git
cd mantra-app
npm install
cp .env.example .env.local
```

Isi `.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=...
GROQ_API_KEY=gsk_...
```

### Menyiapkan Supabase

1. Buat project baru di [supabase.com/dashboard](https://supabase.com/dashboard).
2. Buka **SQL Editor**, tempel isi `supabase/schema.sql`, lalu **Run**.
3. Tempel isi `supabase/seed.sql`, lalu **Run** (50 PTN, 500 prodi).
   Alternatif: setelah schema dibuat, jalankan `npm run seed`.
4. Salin **Project URL** dan **anon public key** dari Settings → API ke `.env.local`.

### Menjalankan

```bash
npm run dev
```

Buka [http://localhost:3000](http://localhost:3000).

## Skrip

| Perintah | Fungsi |
|---|---|
| `npm run dev` | Development server |
| `npm run build` | Production build |
| `npm run start` | Jalankan hasil build |
| `npm run seed` | Isi Supabase via REST (butuh schema sudah dibuat) |
| `npm run seed:sql` | Generate ulang `supabase/seed.sql` dari `scripts/seed-data.mjs` |

## Struktur

```
app/
  page.tsx              Data diri + sekolah + target prodi
  rapor/page.tsx        Input nilai 5 semester
  prestasi/page.tsx     Input prestasi
  snbp/page.tsx         Prediksi SNBP
  snbt/page.tsx         Prediksi SNBT (7 subtes)
  chat/page.tsx         MANTRA Care
  api/chat/route.ts     Proxy Groq + rate limit
components/
  HasilPrediksi.tsx     Tampilan hasil bersama SNBP/SNBT
  ProdiSearch.tsx       Pencarian prodi
lib/
  config.ts             Semua hyperparameter & prompt
  scoring.ts            Rumus skor
  prediction.ts         Probabilitas, interval, faktor
supabase/
  schema.sql            9 tabel + 1 view
  seed.sql              50 PTN × 10 prodi
```

## Deploy ke Vercel

1. Import repo di Vercel.
2. Settings → Environment Variables, tambahkan:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `GROQ_API_KEY`
3. Deploy ulang. Build tidak lagi gagal kalau env belum diisi, tetapi fitur database/chat baru aktif setelah env diisi.

## Catatan Data

Data 500 prodi di `supabase/seed.sql` adalah **estimasi wajar** (daya tampung, peminat historis, median) untuk keperluan demo, bukan angka resmi SNPMB. Ganti dengan data resmi saat tersedia. Semua parameter prediksi berada di `lib/config.ts`.
