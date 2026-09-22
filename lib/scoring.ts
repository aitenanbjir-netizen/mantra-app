// ================================================================
// MANTRA — SCORING ENGINE
// Fungsi murni (tanpa efek samping). Semua rumus sesuai spec §3 & §4.
// ================================================================

import {
  LEVEL_WEIGHT,
  RANK_WEIGHT,
  RELEVANSI_BONUS,
  RELEVANSI_NETRAL,
  PRESTASI_DIMINISHING_FACTOR,
  AKREDITASI_WEIGHT,
  INDEKS_SEKOLAH_DEFAULT,
  COEF_TREN,
  COEF_KONSISTEN,
  COEF_SEKOLAH,
  COEF_PERINGKAT,
  TREN_CLAMP_MIN,
  TREN_CLAMP_MAX,
  KONSISTEN_DIVISOR,
  SIGMOID_SCALE,
  SIGMA_SNBP,
  SIGMA_SNBT,
  PENALTI_URUTAN,
  KATEGORI,
  BOBOT_SNBP_DEFAULT,
  BOBOT_SNBT_DEFAULT,
} from './config';

// ---------- TIPE ----------
export type NilaiRapor = {
  semester: number;
  mapel: string;
  nilai: number;
};

export type Prestasi = {
  level: string;
  peringkat: number | null;
  relevan_prodi: boolean;
};

export type BobotSNBP = {
  rapor_umum: number;
  mapel_pendukung: number;
  prestasi: number;
  tka: number;
};

// ---------- 3.1 FITUR RAPOR ----------
export function hitungRataRapor(rapor: NilaiRapor[]): number {
  if (rapor.length === 0) return 0;
  const total = rapor.reduce((sum, r) => sum + r.nilai, 0);
  return total / rapor.length;
}

export function hitungRataMapel(
  rapor: NilaiRapor[],
  mapelList: string[]
): number {
  const filtered = rapor.filter((r) => mapelList.includes(r.mapel));
  if (filtered.length === 0) return 0;
  const total = filtered.reduce((sum, r) => sum + r.nilai, 0);
  return total / filtered.length;
}

export function hitungRataPerSemester(rapor: NilaiRapor[]): number[] {
  const result: number[] = [];
  for (let s = 1; s <= 5; s++) {
    const nilaiSem = rapor.filter((r) => r.semester === s);
    if (nilaiSem.length === 0) {
      result.push(0);
    } else {
      const total = nilaiSem.reduce((sum, r) => sum + r.nilai, 0);
      result.push(total / nilaiSem.length);
    }
  }
  return result;
}

export function hitungTren(mu: number[]): number {
  const valid = mu.filter((v) => v > 0);
  if (valid.length < 2) return 0;

  const n = valid.length;
  const sumX = (n * (n - 1)) / 2;
  const sumY = valid.reduce((a, b) => a + b, 0);
  const sumXY = valid.reduce((acc, y, i) => acc + i * y, 0);
  const sumX2 = (n * (n - 1) * (2 * n - 1)) / 6;

  const slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX);

  return Math.max(TREN_CLAMP_MIN, Math.min(TREN_CLAMP_MAX, slope));
}

export function hitungKonsistensi(mu: number[]): number {
  const valid = mu.filter((v) => v > 0);
  if (valid.length < 2) return 0.5;

  const mean = valid.reduce((a, b) => a + b, 0) / valid.length;
  const variance =
    valid.reduce((sum, v) => sum + Math.pow(v - mean, 2), 0) / valid.length;
  const stdev = Math.sqrt(variance);

  const raw = 1 - stdev / KONSISTEN_DIVISOR;
  return Math.max(0, Math.min(1, raw));
}

// ---------- 3.2 SKOR PRESTASI ----------
export function hitungSkorPrestasi(prestasiList: Prestasi[]): number {
  if (prestasiList.length === 0) return 0;

  const items = prestasiList
    .map((p) => {
      const lw = LEVEL_WEIGHT[p.level] ?? 0.05;
      const rw =
        p.peringkat !== null
          ? RANK_WEIGHT[String(p.peringkat)] ?? 0.5
          : RANK_WEIGHT['null'];
      const rel = p.relevan_prodi ? RELEVANSI_BONUS : RELEVANSI_NETRAL;
      return 100 * lw * rw * rel;
    })
    .sort((a, b) => b - a);

  let total = 0;
  for (let i = 0; i < items.length; i++) {
    total += items[i] * Math.pow(PRESTASI_DIMINISHING_FACTOR, i);
  }

  return Math.min(100, total);
}

// ---------- 3.3 INDEKS SEKOLAH ----------
export function hitungSkorSekolah(
  akreditasi: string,
  indeksSekolahDiPTN: number = INDEKS_SEKOLAH_DEFAULT
): number {
  const aw = AKREDITASI_WEIGHT[akreditasi] ?? 0.5;
  return 0.5 * aw + 0.5 * indeksSekolahDiPTN;
}

export function hitungPeringkatFaktor(
  peringkat: number | null,
  jumlahEligible: number | null
): number {
  if (!peringkat || !jumlahEligible || jumlahEligible === 0) return 0.5;
  const raw = 1 - peringkat / jumlahEligible;
  return Math.max(0, Math.min(1, raw));
}

// ---------- 3.4 SKOR KOMPOSIT SNBP ----------
export function hitungSkorSNBP(params: {
  rapor: NilaiRapor[];
  mapelPendukung: string[];
  prestasi: Prestasi[];
  skorTKA: number | null;
  akreditasi: string;
  indeksSekolahDiPTN: number;
  peringkatKelas: number | null;
  jumlahEligible: number | null;
  bobot?: BobotSNBP;
}): {
  skorFinal: number;
  breakdown: {
    S_rapor: number;
    S_pendukung: number;
    S_prestasi: number;
    S_tka: number;
    S_tren: number;
    S_konsisten: number;
    S_sekolah: number;
    peringkat_faktor: number;
  };
} {
  const bobot = params.bobot ?? BOBOT_SNBP_DEFAULT;

  const S_rapor = hitungRataRapor(params.rapor);
  const S_pendukung = hitungRataMapel(params.rapor, params.mapelPendukung);
  const mu = hitungRataPerSemester(params.rapor);
  const S_tren = hitungTren(mu);
  const S_konsisten = hitungKonsistensi(mu);
  const S_prestasi = hitungSkorPrestasi(params.prestasi);
  const S_tka = params.skorTKA ?? 0;
  const S_sekolah = hitungSkorSekolah(
    params.akreditasi,
    params.indeksSekolahDiPTN
  );
  const peringkat_faktor = hitungPeringkatFaktor(
    params.peringkatKelas,
    params.jumlahEligible
  );

  const BASE =
    bobot.rapor_umum * S_rapor +
    bobot.mapel_pendukung * S_pendukung +
    bobot.prestasi * S_prestasi +
    bobot.tka * S_tka;

  const skorFinal =
    BASE *
    (1 + COEF_TREN * S_tren) *
    (1 + COEF_KONSISTEN * (S_konsisten - 0.5)) *
    (1 + COEF_SEKOLAH * (S_sekolah - 0.5)) *
    (1 + COEF_PERINGKAT * (peringkat_faktor - 0.5));

  return {
    skorFinal: Math.round(skorFinal * 100) / 100,
    breakdown: {
      S_rapor: Math.round(S_rapor * 100) / 100,
      S_pendukung: Math.round(S_pendukung * 100) / 100,
      S_prestasi: Math.round(S_prestasi * 100) / 100,
      S_tka,
      S_tren: Math.round(S_tren * 100) / 100,
      S_konsisten: Math.round(S_konsisten * 100) / 100,
      S_sekolah: Math.round(S_sekolah * 100) / 100,
      peringkat_faktor: Math.round(peringkat_faktor * 100) / 100,
    },
  };
}

// ---------- 3.5 SKOR KOMPOSIT SNBT ----------
export function hitungSkorUTBK(
  skorSubtes: Record<string, number>,
  bobot: Record<string, number> = BOBOT_SNBT_DEFAULT
): number {
  let total = 0;
  for (const kode of Object.keys(bobot)) {
    const s = skorSubtes[kode] ?? 0;
    total += bobot[kode] * s;
  }
  return Math.round(total * 100) / 100;
}

// ---------- 4.1 PREDIKSI LAPIS 1 ----------
export function hitungKeketatan(
  dayaTampung: number,
  peminat: number
): number {
  if (peminat === 0) return 1;
  return Math.min(1, dayaTampung / peminat);
}

export function estimasiCutoff(
  medianPelamar: number,
  sigma: number,
  keketatan: number
): number {
  // quantile normal untuk 1 - keketatan
  // approximation menggunakan inverse normal sederhana
  const p = 1 - keketatan;
  const z = inverseNormalCDF(p);
  return medianPelamar + z * sigma;
}

// Inverse normal CDF (approximation Beasley-Springer-Moro)
function inverseNormalCDF(p: number): number {
  if (p <= 0) return -10;
  if (p >= 1) return 10;

  const a = [
    -3.969683028665376e1, 2.209460984245205e2, -2.759285104469687e2,
    1.38357751867269e2, -3.066479806614716e1, 2.506628277459239,
  ];
  const b = [
    -5.447609879822406e1, 1.615858368580409e2, -1.556989798598866e2,
    6.680131188771972e1, -1.328068155288572e1,
  ];
  const c = [
    -7.784894002430293e-3, -3.223964580411365e-1, -2.400758277161838,
    -2.549732539343734, 4.374664141464968, 2.938163982698783,
  ];
  const d = [
    7.784695709041462e-3, 3.224671290700398e-1, 2.445134137142996,
    3.754408661907416,
  ];

  const pLow = 0.02425;
  const pHigh = 1 - pLow;

  let q: number, r: number;

  if (p < pLow) {
    q = Math.sqrt(-2 * Math.log(p));
    return (
      (((((c[0] * q + c[1]) * q + c[2]) * q + c[3]) * q + c[4]) * q + c[5]) /
      ((((d[0] * q + d[1]) * q + d[2]) * q + d[3]) * q + 1)
    );
  } else if (p <= pHigh) {
    q = p - 0.5;
    r = q * q;
    return (
      ((((((a[0] * r + a[1]) * r + a[2]) * r + a[3]) * r + a[4]) * r + a[5]) *
        q) /
      (((((b[0] * r + b[1]) * r + b[2]) * r + b[3]) * r + b[4]) * r + 1)
    );
  } else {
    q = Math.sqrt(-2 * Math.log(1 - p));
    return (
      -(((((c[0] * q + c[1]) * q + c[2]) * q + c[3]) * q + c[4]) * q + c[5]) /
      ((((d[0] * q + d[1]) * q + d[2]) * q + d[3]) * q + 1)
    );
  }
}

export function hitungProbabilitas(params: {
  skorPelamar: number;
  estimasiCutoff: number;
  sigma: number;
  urutanPilihan: number;
}): number {
  const z = (params.skorPelamar - params.estimasiCutoff) / params.sigma;
  const pRaw = 1 / (1 + Math.exp(-SIGMOID_SCALE * z));
  const penalti = PENALTI_URUTAN[params.urutanPilihan] ?? 1;
  return Math.max(0, Math.min(1, pRaw * penalti));
}

export function hitungProbabilitasTotalSNBP(
  p1: number,
  p2: number
): number {
  return p1 + (1 - p1) * p2;
}

export function hitungProbabilitasTotalSNBT(probabilitas: number[]): number {
  let gagal = 1;
  for (const p of probabilitas) {
    gagal *= 1 - p;
  }
  return 1 - gagal;
}

// ---------- INTERVAL KEPERCAYAAN ----------
export function hitungInterval(
  probabilitas: number,
  confidence: string = 'sedang'
): [number, number] {
  const delta =
    confidence === 'tinggi' ? 0.08 : confidence === 'sedang' ? 0.12 : 0.18;
  return [
    Math.max(0, Math.round((probabilitas - delta) * 100) / 100),
    Math.min(1, Math.round((probabilitas + delta) * 100) / 100),
  ];
}

// ---------- KATEGORI ----------
export function getKategori(probabilitas: number): {
  key: string;
  label: string;
  warna: string;
} {
  for (const [key, val] of Object.entries(KATEGORI)) {
    if (probabilitas >= val.min && probabilitas < val.max) {
      return { key, label: val.label, warna: val.warna };
    }
  }
  return {
    key: 'SANGAT_BESAR',
    label: KATEGORI.SANGAT_BESAR.label,
    warna: KATEGORI.SANGAT_BESAR.warna,
  };
}

// ---------- SIGMA HELPER ----------
export function getSigma(jalur: 'SNBP' | 'SNBT'): number {
  return jalur === 'SNBP' ? SIGMA_SNBP : SIGMA_SNBT;
}