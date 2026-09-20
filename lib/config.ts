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

// ---------- DISCLAIMER ----------
export const DISCLAIMER_TEXT =
  'Hasil di halaman ini adalah estimasi statistik berdasarkan data publik daya tampung–peminat dan data yang kamu masukkan sendiri. Panitia SNPMB tidak mempublikasikan nilai ambang kelulusan, sehingga angka di sini TIDAK dapat dijadikan jaminan diterima atau ditolak. Gunakan sebagai bahan pertimbangan, bukan sebagai dasar tunggal keputusan.';

export const MODEL_VERSION = 'v1.0';
export const DATA_VINTAGE = 2026;