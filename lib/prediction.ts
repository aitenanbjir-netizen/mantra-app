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
  if (peminatHistoris.length === 0) return 1000;
  if (peminatHistoris.length === 1) return peminatHistoris[0];

  const recent = peminatHistoris.slice(-3);
  const avg = recent.reduce((a, b) => a + b, 0) / recent.length;

  if (recent.length >= 2) {
    const slope =
      (recent[recent.length - 1] - recent[0]) / (recent.length - 1);
    return Math.max(100, Math.round(avg + slope));
  }

  return Math.round(avg);
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

  if (selisih > 0) {
    pendorong.push({
      faktor: `Skor di atas estimasi cutoff (+${selisih.toFixed(1)})`,
      kontribusi: `+${Math.min(0.3, selisih / 50).toFixed(2)}`,
    });
  } else {
    penghambat.push({
      faktor: `Skor di bawah estimasi cutoff (${selisih.toFixed(1)})`,
      kontribusi: `${Math.max(-0.3, selisih / 50).toFixed(2)}`,
    });
  }

  if (params.keketatan >= 0.15) {
    pendorong.push({
      faktor: `Keketatan rendah (1:${Math.round(1 / params.keketatan)})`,
      kontribusi: '+0.05',
    });
  } else if (params.keketatan <= 0.05) {
    penghambat.push({
      faktor: `Keketatan tinggi (1:${Math.round(1 / params.keketatan)})`,
      kontribusi: '-0.14',
    });
  }

  if (params.urutan > 1) {
    const penaltiMap = [1, 0.72, 0.55, 0.42];
    penghambat.push({
      faktor: `Pilihan ke-${params.urutan} (bersaing sisa kursi)`,
      kontribusi: `-${((1 - penaltiMap[params.urutan - 1]) * 0.2).toFixed(2)}`,
    });
  }

  if (params.breakdownSkor && params.jalur === 'SNBP') {
    const b = params.breakdownSkor;
    if (b.S_tren > 0.3) {
      pendorong.push({
        faktor: 'Tren nilai naik konsisten',
        kontribusi: '+0.06',
      });
    } else if (b.S_tren < -0.3) {
      penghambat.push({
        faktor: 'Tren nilai menurun',
        kontribusi: '-0.06',
      });
    }

    if (b.S_konsisten > 0.7) {
      pendorong.push({
        faktor: 'Nilai sangat konsisten',
        kontribusi: '+0.04',
      });
    }

    if (b.S_prestasi > 20) {
      pendorong.push({
        faktor: 'Prestasi relevan kuat',
        kontribusi: '+0.08',
      });
    } else if (b.S_prestasi < 5) {
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
}): string[] {
  const saran: string[] = [];

  if (params.jalur === 'SNBP' && params.breakdownSkor) {
    const b = params.breakdownSkor;
    if (b.S_pendukung < 85) {
      saran.push('Naikkan nilai mapel pendukung di semester 5.');
    }
    if (b.S_rapor < 85) {
      saran.push('Perbaiki rata-rata seluruh mapel agar lebih kompetitif.');
    }
    if (b.S_tren < 0) {
      saran.push('Tunjukkan tren nilai naik dari semester 4 ke 5.');
    }
    if (b.S_prestasi < 10) {
      saran.push(
        'Ikut minimal 1 lomba tingkat kab/kota yang relevan dengan prodi.'
      );
    }
  }

  if (params.jalur === 'SNBT') {
    saran.push(
      'Perbanyak tryout UTBK untuk melatih manajemen waktu 195 menit.'
    );
    saran.push('Fokus pada subtes dengan skor terendah.');
  }

  if (params.probabilitas < 0.35) {
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
  if (params.pilihan.length === 0 || params.pilihan.length > 2) {
    throw new Error('SNBP memerlukan 1-2 pilihan prodi.');
  }

  const sigma = getSigma('SNBP' as any);
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
      indeksSekolahDiPTN: params.siswa.indeksSekolahDiPTN ?? 0.5,
      peringkatKelas: params.siswa.peringkatKelas,
      jumlahEligible: params.siswa.jumlahEligible,
      bobot: p.bobotSNBP,
    });

    const skorFinal = result.skorFinal;
    const breakdown = result.breakdown as BreakdownSkor;

    const peminat = estimasiPeminatTahunIni(p.peminatHistoris);
    const keketatan = hitungKeketatan(p.dayaTampung, peminat);
    const medianPelamar = p.medianPelamar ?? 80;
    const cutoff = estimasiCutoff(medianPelamar, sigma, keketatan);

    const prob = hitungProbabilitas({
      skorPelamar: skorFinal,
      estimasiCutoff: cutoff,
      sigma,
      urutanPilihan: urutan,
    });

    probabilitasList.push(prob);

    const [low, high] = hitungInterval(prob, CONFIDENCE_LEVEL.SEDANG);
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
      confidenceData: CONFIDENCE_LEVEL.SEDANG,
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
  if (params.pilihan.length === 0 || params.pilihan.length > 4) {
    throw new Error('SNBT memerlukan 1-4 pilihan prodi.');
  }

  const sigma = getSigma('SNBT' as any);
  const skorKomposit = hitungSkorUTBK(params.skorSubtes);
  const hasilPilihan: HasilPilihanProdi[] = [];
  const probabilitasList: number[] = [];

  for (let i = 0; i < params.pilihan.length; i++) {
    const p = params.pilihan[i];
    const urutan = i + 1;

    const peminat = estimasiPeminatTahunIni(p.peminatHistoris);
    const keketatan = hitungKeketatan(p.dayaTampung, peminat);
    const medianPelamar = p.medianPelamar ?? 620;
    const cutoff = estimasiCutoff(medianPelamar, sigma, keketatan);

    const prob = hitungProbabilitas({
      skorPelamar: skorKomposit,
      estimasiCutoff: cutoff,
      sigma,
      urutanPilihan: urutan,
    });

    probabilitasList.push(prob);

    const [low, high] = hitungInterval(prob, CONFIDENCE_LEVEL.SEDANG);
    const kat = getKategori(prob);

    const { pendorong, penghambat } = buatBreakdownFaktor({
      jalur: 'SNBT',
      skorKomposit,
      estimasiCutoff: cutoff,
      keketatan,
      urutan,
    });

    const saranList = buatSaran({
      jalur: 'SNBT',
      probabilitas: prob,
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
      confidenceData: CONFIDENCE_LEVEL.SEDANG,
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