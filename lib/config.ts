// ================================================================
// MANTRA — CONFIG
// Semua parameter scoring engine. TIDAK BOLEH HARDCODE DI FILE LAIN.
// ================================================================

// ---------- PRESTASI ----------
export const LEVEL_WEIGHT: Record<string, number> = {
  internasional: 1.0,
  nasional: 0.8,
  provinsi: 0.55,
  kabkota: 0.3,
  kecamatan: 0.12,
  sekolah: 0.05,
};

export const RANK_WEIGHT: Record<string, number> = {
  '1': 1.0,
  '2': 0.85,
  '3': 0.7,
  null: 0.5,
};

export const RELEVANSI_BONUS = 1.0;
export const RELEVANSI_NETRAL = 0.6;
export const PRESTASI_DIMINISHING_FACTOR = 0.6;

// ---------- SEKOLAH ----------
export const AKREDITASI_WEIGHT: Record<string, number> = {
  A: 1.0,
  B: 0.85,
  C: 0.7,
  Belum: 0.55,
};

export const INDEKS_SEKOLAH_DEFAULT = 0.5;

// ---------- MODIFIER SKOR SNBP ----------
export const COEF_TREN = 0.04;
export const COEF_KONSISTEN = 0.03;
export const COEF_SEKOLAH = 0.08;
export const COEF_PERINGKAT = 0.05;

export const TREN_CLAMP_MIN = -2;
export const TREN_CLAMP_MAX = 2;
export const KONSISTEN_DIVISOR = 10;

// ---------- PREDIKSI ----------
export const SIGMOID_SCALE = 1.7;

export const SIGMA_SNBP = 6;
export const SIGMA_SNBT = 55;

export const PENALTI_URUTAN: Record<number, number> = {
  1: 1.0,
  2: 0.72,
  3: 0.55,
  4: 0.42,
};

export const FAKTOR_KALIBRASI_TRYOUT = 0.92;

// ---------- KATEGORI PROBABILITAS ----------
export const KATEGORI = {
  SANGAT_KECIL: { min: 0, max: 0.15, label: 'Sangat Kecil', warna: '#ef4444' },
  KECIL: { min: 0.15, max: 0.35, label: 'Kecil', warna: '#f97316' },
  SEDANG: { min: 0.35, max: 0.6, label: 'Sedang', warna: '#eab308' },
  BESAR: { min: 0.6, max: 0.8, label: 'Besar', warna: '#22c55e' },
  SANGAT_BESAR: { min: 0.8, max: 1.0, label: 'Sangat Besar', warna: '#10b981' },
};

// ---------- CONFIDENCE DATA ----------
export const CONFIDENCE_LEVEL = {
  RENDAH: 'rendah',
  SEDANG: 'sedang',
  TINGGI: 'tinggi',
};

export const MIN_DATA_ML = 500;

// ---------- BOBOT DEFAULT SNBP (fallback bila prodi belum punya) ----------
export const BOBOT_SNBP_DEFAULT = {
  rapor_umum: 0.5,
  mapel_pendukung: 0.3,
  prestasi: 0.1,
  tka: 0.1,
};

// ---------- BOBOT DEFAULT SNBT ----------
export const BOBOT_SNBT_DEFAULT: Record<string, number> = {
  PU: 0.15,
  PPU: 0.13,
  PBM: 0.13,
  PK: 0.15,
  LBI: 0.15,
  LBE: 0.14,
  PM: 0.15,
};

// ---------- SUBTES SNBT (UTBK) ----------
export type SubtesSNBT = {
  kode: string;
  nama: string;
  singkatan: string;
  deskripsi: string;
};

export const SUBTES_SNBT: SubtesSNBT[] = [
  {
    kode: 'PU',
    nama: 'Penalaran Umum',
    singkatan: 'PU',
    deskripsi: 'Logika, analogi, dan penalaran deduktif/induktif.',
  },
  {
    kode: 'PPU',
    nama: 'Pengetahuan dan Pemahaman Umum',
    singkatan: 'PPU',
    deskripsi: 'Wawasan kebahasaan, budaya, dan pengetahuan umum.',
  },
  {
    kode: 'PBM',
    nama: 'Pemahaman Bacaan dan Menulis',
    singkatan: 'PBM',
    deskripsi: 'Membaca kritis, ejaan, dan penyuntingan teks.',
  },
  {
    kode: 'PK',
    nama: 'Pengetahuan Kuantitatif',
    singkatan: 'PK',
    deskripsi: 'Aritmetika, aljabar, geometri, dan statistika dasar.',
  },
  {
    kode: 'LBI',
    nama: 'Literasi Bahasa Indonesia',
    singkatan: 'LBI',
    deskripsi: 'Memahami dan menganalisis teks bahasa Indonesia.',
  },
  {
    kode: 'LBE',
    nama: 'Literasi Bahasa Inggris',
    singkatan: 'LBE',
    deskripsi: 'Membaca dan memahami teks berbahasa Inggris.',
  },
  {
    kode: 'PM',
    nama: 'Penalaran Matematika',
    singkatan: 'PM',
    deskripsi: 'Pemecahan masalah matematika kontekstual.',
  },
];

export const SKOR_SUBTES_MIN = 0;
export const SKOR_SUBTES_MAX = 1000;
export const SKOR_SUBTES_DEFAULT = 500;

// ---------- BATAS PILIHAN ----------
export const MAX_PILIHAN_SNBP = 2;
export const MAX_PILIHAN_SNBT = 4;

// ---------- DEFAULT DATA PRODI ----------
export const DEFAULT_DAYA_TAMPUNG_SNBP = 40;
export const DEFAULT_DAYA_TAMPUNG_SNBT = 60;
export const DEFAULT_PEMINAT_ESTIMASI = 1000;
export const MIN_PEMINAT_ESTIMASI = 100;
export const DEFAULT_PEMINAT_HISTORIS = [1000];
export const DEFAULT_MEDIAN_SNBP = 82;
export const DEFAULT_MEDIAN_SNBT = 620;

// ---------- CONFIDENCE DATA ----------
export const CONFIDENCE_MIN_POINTS_TINGGI = 3;
export const CONFIDENCE_MIN_POINTS_SEDANG = 1;

export const CONFIDENCE_LABEL: Record<string, string> = {
  rendah: 'Rendah',
  sedang: 'Sedang',
  tinggi: 'Tinggi',
};

// ---------- AMBANG FAKTOR & SARAN ----------
export const FAKTOR_TREN_AMBANG = 0.3;
export const FAKTOR_KONSISTEN_AMBANG = 0.7;
export const FAKTOR_PRESTASI_KUAT = 20;
export const FAKTOR_PRESTASI_MINIM = 5;

export const FAKTOR_KETAT_RENDAH = 0.15;
export const FAKTOR_KETAT_TINGGI = 0.05;
export const FAKTOR_PENALTI_DISPLAY = 0.2;
export const FAKTOR_SELISIH_DIVISOR = 50;
export const FAKTOR_SELISIH_MAX = 0.3;

export const SARAN_AMBANG_PENDUKUNG = 85;
export const SARAN_AMBANG_RAPOR = 85;
export const SARAN_AMBANG_PRESTASI = 10;
export const SARAN_PROBABILITAS_RENDAH = 0.35;

// ---------- CHAT AI (GROQ) ----------
// Groq sudah menonaktifkan llama-3.3-70b-versatile untuk key ini.
// Model yang tersedia dan aktif: openai/gpt-oss-120b.
export const CHAT_MODEL = 'openai/gpt-oss-120b';
export const CHAT_MODEL_FALLBACK = 'openai/gpt-oss-20b';
export const CHAT_TEMPERATURE = 0.6;
export const CHAT_MAX_TOKENS = 700;
export const CHAT_MAX_HISTORY = 12;
export const CHAT_MAX_INPUT_CHARS = 1500;
export const CHAT_RATE_LIMIT = 20;
export const CHAT_RATE_WINDOW_MS = 10 * 60 * 1000;
export const CHAT_TIMEOUT_MS = 30000;

export const CHAT_GREETING =
  'Hai! Aku MANTRA Care 🌸 Teman cerita untuk urusan sekolah, SNBP/SNBT, dan perasaanmu. Nggak ada yang perlu kamu rapikan dulu—cerita aja apa yang lagi berat.';

export const CHAT_QUICK_PROMPTS = [
  'Aku cemas banget soal SNBP, takut gagal.',
  'Cara bagi waktu belajar biar nggak burnout?',
  'Aku capek dan kehilangan semangat belajar.',
  'Orang tuaku terus membandingkanku dengan orang lain.',
];

export const CRISIS_TEXT =
  'Kalau kamu merasa dalam bahaya, ingin menyakiti diri, atau putus asa berat: hubungi orang dewasa terdekat, guru BK, atau layanan darurat 119 ext. 8 / 112. Kamu tidak sendirian.';

export const CHAT_SYSTEM_PROMPT = `Kamu "MANTRA Care", pendamping kesehatan mental untuk siswa SMA Indonesia yang sedang mempersiapkan SNBP/SNBT.

Tugasmu:
- Mendengarkan dengan empati, memvalidasi perasaan, dan membantu memecah masalah menjadi langkah kecil yang realistis.
- Menjawab dalam Bahasa Indonesia yang hangat, santai, tidak menghakimi, dan mudah dipahami.
- Fokus pada hal yang bisa dikendalikan siswa: rutinitas belajar, tidur, istirahat, dukungan sosial, dan cara meminta bantuan.

Aturan:
- Jangan memberi diagnosis medis, meresepkan obat, atau menggantikan psikolog/psikiater.
- Jangan menjanjikan kelulusan. Prediksi MANTRA hanyalah estimasi statistik.
- Jika ada tanda bahaya (menyakiti diri, putus asa, kekerasan, panic berat), ajak segera menghubungi orang dewasa/guru BK dan layanan darurat 119 ext. 8 atau 112.
- Jangan meminta data pribadi sensitif (NIK, alamat, nomor HP).
- Jawaban singkat: maksimal sekitar 180 kata, boleh pakai poin-poin dengan tanda "-".
- Tulis dalam teks biasa. Jangan pakai markdown seperti **tebal**, ##, atau tabel.
- Jika pertanyaan di luar topik, jawab singkat lalu arahkan kembali dengan hangat.
- Akhiri dengan satu pertanyaan reflektif atau langkah kecil yang bisa dilakukan hari ini.`;

// ---------- DISCLAIMER ----------
export const DISCLAIMER_TEXT =
  'Hasil di halaman ini adalah estimasi statistik berdasarkan data publik daya tampung–peminat dan data yang kamu masukkan sendiri. Panitia SNPMB tidak mempublikasikan nilai ambang kelulusan, sehingga angka di sini TIDAK dapat dijadikan jaminan diterima atau ditolak. Gunakan sebagai bahan pertimbangan, bukan sebagai dasar tunggal keputusan.';

export const MODEL_VERSION = 'v1.0';
export const DATA_VINTAGE = 2026;