// ================================================================
// MANTRA — PREDICTION ENGINE
// ================================================================

import {
  hitungSkorSNBP,
  hitungSkorUTBK,
  hitungKeketatan,
  estimasiCutoff,
  hitungProbabilitas,
  hitungProbabilitasTotalSNBP,
  hitungProbabilitasTotalSNBT,
  hitungInterval,
  getKategori,
  getSigma,
  type NilaiRapor,
  type Prestasi,
  type BobotSNBP,
} from './scoring';

import {
  CONFIDENCE_LEVEL,
  DATA_VINTAGE,
  MODEL_VERSION,
  DEFAULT_DAYA_TAMPUNG_SNBP,
  DEFAULT_DAYA_TAMPUNG_SNBT,
  DEFAULT_MEDIAN_SNBP,
  DEFAULT_MEDIAN_SNBT,
  DEFAULT_PEMINAT_ESTIMASI,
  MIN_PEMINAT_ESTIMASI,
  MAX_PILIHAN_SNBP,
  MAX_PILIHAN_SNBT,
  PENALTI_URUTAN,
  CONFIDENCE_MIN_POINTS_TINGGI,
  CONFIDENCE_MIN_POINTS_SEDANG,
  FAKTOR_TREN_AMBANG,
  FAKTOR_KONSISTEN_AMBANG,
  FAKTOR_PRESTASI_KUAT,
  FAKTOR_PRESTASI_MINIM,
  FAKTOR_KETAT_RENDAH,
  FAKTOR_KETAT_TINGGI,
  FAKTOR_PENALTI_DISPLAY,
  FAKTOR_SELISIH_DIVISOR,
  FAKTOR_SELISIH_MAX,
  SARAN_AMBANG_PENDUKUNG,
  SARAN_AMBANG_RAPOR,
  SARAN_AMBANG_PRESTASI,
  SARAN_PROBABILITAS_RENDAH,
  SUBTES_SNBT,
  SKOR_SUBTES_MIN,
  SKOR_SUBTES_MAX,
  INDEKS_SEKOLAH_DEFAULT,
} from './config';

// ================================================================
// TIPE
// ================================================================

export type SiswaProfile = {
  rapor: NilaiRapor[];
  prestasi: Prestasi[];
  skorTKA: number | null;
  akreditasi: string;
  indeksSekolahDiPTN?: number;
  peringkatKelas: number | null;
  jumlahEligible: number | null;
};

export type ProdiPilihan = {
  id: string;
  nama: string;
  universitas: string;
  dayaTampung: number;
  peminatHistoris: number[];
  mapelPendukung: string[];
  bobotSNBP?: BobotSNBP;
  medianPelamar?: number;
};

export type HasilPilihanProdi = {
  urutan: number;
  prodiId: string;
  prodiNama: string;
  universitas: string;
  skorKomposit: number;
  estimasiCutoff: number;
  keketatan: number;
  probabilitas: number;
  intervalBawah: number;
  intervalAtas: number;
  kategori: string;
  kategoriLabel: string;
  kategoriWarna: string;
  confidenceData: string;
  faktorPendorong: { faktor: string; kontribusi: string }[];
  faktorPenghambat: { faktor: string; kontribusi: string }[];
  saran: string[];
};

export type HasilPrediksi = {
  jalur: 'SNBP' | 'SNBT';
  pilihan: HasilPilihanProdi[];
  probabilitasTotal: number;
  modelVersion: string;
  dataVintage: number;
  disclaimer: string;
};

type BreakdownSkor = {
  S_rapor: number;
  S_pendukung: number;
  S_prestasi: number;
  S_tka: number;
  S_tren: number;
  S_konsisten: number;
  S_sekolah: number;
  peringkat_faktor: number;
};

// ================================================================
// HELPER
// ================================================================

function estimasiPeminatTahunIni(peminatHistoris: number[]): number {
  const valid = peminatHistoris.filter((n) => Number.isFinite(n) && n > 0);
  if (valid.length === 0) return DEFAULT_PEMINAT_ESTIMASI;
  if (valid.length === 1) return valid[0];

  const recent = valid.slice(-3);
  const avg = recent.reduce((a, b) => a + b, 0) / recent.length;

  if (recent.length >= 2) {
    const slope =
      (recent[recent.length - 1] - recent[0]) / (recent.length - 1);
    return Math.max(MIN_PEMINAT_ESTIMASI, Math.round(avg + slope));
  }

  return Math.round(avg);
}

function getConfidenceData(jumlahData: number): string {
  if (jumlahData >= CONFIDENCE_MIN_POINTS_TINGGI) {
    return CONFIDENCE_LEVEL.TINGGI;
  }
  if (jumlahData >= CONFIDENCE_MIN_POINTS_SEDANG) {
    return CONFIDENCE_LEVEL.SEDANG;
  }
  return CONFIDENCE_LEVEL.RENDAH;
}

function buatBreakdownFaktor(params: {
  jalur: string;
  skorKomposit: number;
  estimasiCutoff: number;
  keketatan: number;
  urutan: number;
  breakdownSkor?: BreakdownSkor;
}): {
  pendorong: { faktor: string; kontribusi: string }[];
  penghambat: { faktor: string; kontribusi: string }[];
} {
  const pendorong: { faktor: string; kontribusi: string }[] = [];
  const penghambat: { faktor: string; kontribusi: string }[] = [];

  const selisih = params.skorKomposit - params.estimasiCutoff;
  const kontribusiSelisih = Math.max(
    -FAKTOR_SELISIH_MAX,
    Math.min(FAKTOR_SELISIH_MAX, selisih / FAKTOR_SELISIH_DIVISOR)
  );

  if (selisih > 0) {
    pendorong.push({
      faktor: `Skor di atas estimasi cutoff (+${selisih.toFixed(1)})`,
      kontribusi: `+${kontribusiSelisih.toFixed(2)}`,
    });
  } else {
    penghambat.push({
      faktor: `Skor di bawah estimasi cutoff (${selisih.toFixed(1)})`,
      kontribusi: kontribusiSelisih.toFixed(2),
    });
  }

  if (params.keketatan >= FAKTOR_KETAT_RENDAH) {
    pendorong.push({
      faktor: `Keketatan rendah (1:${Math.round(1 / params.keketatan)})`,
      kontribusi: '+0.05',
    });
  } else if (params.keketatan <= FAKTOR_KETAT_TINGGI) {
    penghambat.push({
      faktor: `Keketatan tinggi (1:${Math.round(1 / params.keketatan)})`,
      kontribusi: '-0.14',
    });
  }

  if (params.urutan > 1) {
    const penalti = PENALTI_URUTAN[params.urutan] ?? 1;
    penghambat.push({
      faktor: `Pilihan ke-${params.urutan} (bersaing sisa kursi)`,
      kontribusi: `-${((1 - penalti) * FAKTOR_PENALTI_DISPLAY).toFixed(2)}`,
    });
  }

  if (params.breakdownSkor && params.jalur === 'SNBP') {
    const b = params.breakdownSkor;
    if (b.S_tren > FAKTOR_TREN_AMBANG) {
      pendorong.push({
        faktor: 'Tren nilai naik konsisten',
        kontribusi: '+0.06',
      });
    } else if (b.S_tren < -FAKTOR_TREN_AMBANG) {
      penghambat.push({
        faktor: 'Tren nilai menurun',
        kontribusi: '-0.06',
      });
    }

    if (b.S_konsisten > FAKTOR_KONSISTEN_AMBANG) {
      pendorong.push({
        faktor: 'Nilai sangat konsisten',
        kontribusi: '+0.04',
      });
    }

    if (b.S_prestasi > FAKTOR_PRESTASI_KUAT) {
      pendorong.push({
        faktor: 'Prestasi relevan kuat',
        kontribusi: '+0.08',
      });
    } else if (b.S_prestasi < FAKTOR_PRESTASI_MINIM) {
      penghambat.push({
        faktor: 'Prestasi minim / tidak relevan',
        kontribusi: '-0.05',
      });
    }
  }

  return { pendorong, penghambat };
}

function buatSaran(params: {
  jalur: string;
  probabilitas: number;
  breakdownSkor?: BreakdownSkor;
  subtesTerendah?: { nama: string; skor: number };
}): string[] {
  const saran: string[] = [];

  if (params.jalur === 'SNBP' && params.breakdownSkor) {
    const b = params.breakdownSkor;
    if (b.S_pendukung < SARAN_AMBANG_PENDUKUNG) {
      saran.push('Naikkan nilai mapel pendukung di semester 5.');
    }
    if (b.S_rapor < SARAN_AMBANG_RAPOR) {
      saran.push('Perbaiki rata-rata seluruh mapel agar lebih kompetitif.');
    }
    if (b.S_tren < 0) {
      saran.push('Tunjukkan tren nilai naik dari semester 4 ke 5.');
    }
    if (b.S_prestasi < SARAN_AMBANG_PRESTASI) {
      saran.push(
        'Ikut minimal 1 lomba tingkat kab/kota yang relevan dengan prodi.'
      );
    }
    if (b.S_tka === 0) {
      saran.push(
        'Kalau kamu punya nilai TKA, tambahkan agar estimasi lebih akurat.'
      );
    }
  }

  if (params.jalur === 'SNBT') {
    saran.push(
      'Perbanyak tryout UTBK untuk melatih manajemen waktu 195 menit.'
    );
    if (params.subtesTerendah) {
      saran.push(
        `Fokus latihan ${params.subtesTerendah.nama} (skor ${params.subtesTerendah.skor}) karena menjadi subtes terlemahmu.`
      );
    } else {
      saran.push('Fokus pada subtes dengan skor terendah.');
    }
  }

  if (params.probabilitas < SARAN_PROBABILITAS_RENDAH) {
    saran.push('Pertimbangkan prodi alternatif dengan keketatan lebih rendah.');
  }

  return saran;
}

// ================================================================
// PREDIKSI SNBP
// ================================================================

export function prediksiSNBP(params: {
  siswa: SiswaProfile;
  pilihan: ProdiPilihan[];
  disclaimer: string;
}): HasilPrediksi {
  if (
    params.pilihan.length === 0 ||
    params.pilihan.length > MAX_PILIHAN_SNBP
  ) {
    throw new Error(`SNBP memerlukan 1-${MAX_PILIHAN_SNBP} pilihan prodi.`);
  }

  const sigma = getSigma('SNBP');
  const hasilPilihan: HasilPilihanProdi[] = [];
  const probabilitasList: number[] = [];

  for (let i = 0; i < params.pilihan.length; i++) {
    const p = params.pilihan[i];
    const urutan = i + 1;

    const result = hitungSkorSNBP({
      rapor: params.siswa.rapor,
      mapelPendukung: p.mapelPendukung,
      prestasi: params.siswa.prestasi,
      skorTKA: params.siswa.skorTKA,
      akreditasi: params.siswa.akreditasi,
      indeksSekolahDiPTN:
        params.siswa.indeksSekolahDiPTN ?? INDEKS_SEKOLAH_DEFAULT,
      peringkatKelas: params.siswa.peringkatKelas,
      jumlahEligible: params.siswa.jumlahEligible,
      bobot: p.bobotSNBP,
    });

    const skorFinal = result.skorFinal;
    const breakdown = result.breakdown as BreakdownSkor;

    const dayaTampung =
      p.dayaTampung > 0 ? p.dayaTampung : DEFAULT_DAYA_TAMPUNG_SNBP;
    const peminat = estimasiPeminatTahunIni(p.peminatHistoris);
    const keketatan = hitungKeketatan(dayaTampung, peminat);
    const medianPelamar = p.medianPelamar ?? DEFAULT_MEDIAN_SNBP;
    const cutoff = estimasiCutoff(medianPelamar, sigma, keketatan);

    const prob = hitungProbabilitas({
      skorPelamar: skorFinal,
      estimasiCutoff: cutoff,
      sigma,
      urutanPilihan: urutan,
    });

    probabilitasList.push(prob);

    const confidence = getConfidenceData(
      p.peminatHistoris.length + (p.medianPelamar ? 1 : 0)
    );
    const [low, high] = hitungInterval(prob, confidence);
    const kat = getKategori(prob);

    const { pendorong, penghambat } = buatBreakdownFaktor({
      jalur: 'SNBP',
      skorKomposit: skorFinal,
      estimasiCutoff: cutoff,
      keketatan,
      urutan,
      breakdownSkor: breakdown,
    });

    const saranList = buatSaran({
      jalur: 'SNBP',
      probabilitas: prob,
      breakdownSkor: breakdown,
    });

    hasilPilihan.push({
      urutan,
      prodiId: p.id,
      prodiNama: p.nama,
      universitas: p.universitas,
      skorKomposit: skorFinal,
      estimasiCutoff: Math.round(cutoff * 100) / 100,
      keketatan: Math.round(keketatan * 1000) / 1000,
      probabilitas: Math.round(prob * 100) / 100,
      intervalBawah: low,
      intervalAtas: high,
      kategori: kat.key,
      kategoriLabel: kat.label,
      kategoriWarna: kat.warna,
      confidenceData: confidence,
      faktorPendorong: pendorong,
      faktorPenghambat: penghambat,
      saran: saranList,
    });
  }

  const p1 = probabilitasList[0] ?? 0;
  const p2 = probabilitasList[1] ?? 0;
  const probTotal =
    params.pilihan.length === 2
      ? hitungProbabilitasTotalSNBP(p1, p2)
      : p1;

  return {
    jalur: 'SNBP',
    pilihan: hasilPilihan,
    probabilitasTotal: Math.round(probTotal * 100) / 100,
    modelVersion: MODEL_VERSION,
    dataVintage: DATA_VINTAGE,
    disclaimer: params.disclaimer,
  };
}

// ================================================================
// PREDIKSI SNBT
// ================================================================

export function prediksiSNBT(params: {
  skorSubtes: Record<string, number>;
  pilihan: ProdiPilihan[];
  disclaimer: string;
}): HasilPrediksi {
  if (
    params.pilihan.length === 0 ||
    params.pilihan.length > MAX_PILIHAN_SNBT
  ) {
    throw new Error(`SNBT memerlukan 1-${MAX_PILIHAN_SNBT} pilihan prodi.`);
  }

  const belumLengkap = SUBTES_SNBT.filter(
    (s) =>
      typeof params.skorSubtes[s.kode] !== 'number' ||
      !Number.isFinite(params.skorSubtes[s.kode])
  );
  if (belumLengkap.length > 0) {
    throw new Error(
      `Skor subtes belum lengkap: ${belumLengkap
        .map((s) => s.singkatan)
        .join(', ')}.`
    );
  }

  const skorBersih: Record<string, number> = {};
  for (const s of SUBTES_SNBT) {
    skorBersih[s.kode] = Math.max(
      SKOR_SUBTES_MIN,
      Math.min(SKOR_SUBTES_MAX, Number(params.skorSubtes[s.kode]))
    );
  }

  const sigma = getSigma('SNBT');
  const skorKomposit = hitungSkorUTBK(skorBersih);
  const urutSubtes = SUBTES_SNBT.map((s) => ({
    nama: s.nama,
    skor: skorBersih[s.kode],
  })).sort((a, b) => a.skor - b.skor);
  const terendah = urutSubtes[0];
  const tertinggi = urutSubtes[urutSubtes.length - 1];

  const hasilPilihan: HasilPilihanProdi[] = [];
  const probabilitasList: number[] = [];

  for (let i = 0; i < params.pilihan.length; i++) {
    const p = params.pilihan[i];
    const urutan = i + 1;

    const dayaTampung =
      p.dayaTampung > 0 ? p.dayaTampung : DEFAULT_DAYA_TAMPUNG_SNBT;
    const peminat = estimasiPeminatTahunIni(p.peminatHistoris);
    const keketatan = hitungKeketatan(dayaTampung, peminat);
    const medianPelamar = p.medianPelamar ?? DEFAULT_MEDIAN_SNBT;
    const cutoff = estimasiCutoff(medianPelamar, sigma, keketatan);

    const prob = hitungProbabilitas({
      skorPelamar: skorKomposit,
      estimasiCutoff: cutoff,
      sigma,
      urutanPilihan: urutan,
    });

    probabilitasList.push(prob);

    const confidence = getConfidenceData(
      p.peminatHistoris.length + (p.medianPelamar ? 1 : 0)
    );
    const [low, high] = hitungInterval(prob, confidence);
    const kat = getKategori(prob);

    const { pendorong, penghambat } = buatBreakdownFaktor({
      jalur: 'SNBT',
      skorKomposit,
      estimasiCutoff: cutoff,
      keketatan,
      urutan,
    });

    pendorong.push({
      faktor: `Subtes terkuat: ${tertinggi.nama} (${tertinggi.skor})`,
      kontribusi: '+0.04',
    });
    penghambat.push({
      faktor: `Subtes terlemah: ${terendah.nama} (${terendah.skor})`,
      kontribusi: '-0.04',
    });

    const saranList = buatSaran({
      jalur: 'SNBT',
      probabilitas: prob,
      subtesTerendah: terendah,
    });

    hasilPilihan.push({
      urutan,
      prodiId: p.id,
      prodiNama: p.nama,
      universitas: p.universitas,
      skorKomposit,
      estimasiCutoff: Math.round(cutoff * 100) / 100,
      keketatan: Math.round(keketatan * 1000) / 1000,
      probabilitas: Math.round(prob * 100) / 100,
      intervalBawah: low,
      intervalAtas: high,
      kategori: kat.key,
      kategoriLabel: kat.label,
      kategoriWarna: kat.warna,
      confidenceData: confidence,
      faktorPendorong: pendorong,
      faktorPenghambat: penghambat,
      saran: saranList,
    });
  }

  const probTotal = hitungProbabilitasTotalSNBT(probabilitasList);

  return {
    jalur: 'SNBT',
    pilihan: hasilPilihan,
    probabilitasTotal: Math.round(probTotal * 100) / 100,
    modelVersion: MODEL_VERSION,
    dataVintage: DATA_VINTAGE,
    disclaimer: params.disclaimer,
  };
}

// ================================================================
// KLASIFIKASI PRODI
// ================================================================

export function klasifikasiProdi(probabilitas: number): {
  label: string;
  warna: string;
} {
  if (probabilitas >= 0.6) return { label: 'AMAN', warna: '#22c55e' };
  if (probabilitas >= 0.35) return { label: 'REALISTIS', warna: '#eab308' };
  return { label: 'AMBISIUS', warna: '#ef4444' };
}
