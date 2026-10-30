'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';
import {
  prediksiSNBP,
  type SiswaProfile,
  type ProdiPilihan,
  type HasilPrediksi,
} from '@/lib/prediction';
import {
  DISCLAIMER_TEXT,
  DEFAULT_DAYA_TAMPUNG_SNBP,
  DEFAULT_MEDIAN_SNBP,
  DEFAULT_PEMINAT_HISTORIS,
  INDEKS_SEKOLAH_DEFAULT,
} from '@/lib/config';
import { Button } from '@/components/ui/button';
import { HasilPrediksiView } from '@/components/HasilPrediksi';

type SiswaCache = {
  id: string;
  nama: string;
  kelas?: string;
  sekolah_id?: string;
  akreditasi?: string;
  peringkatKelas?: number | null;
  jumlahEligible?: number | null;
  target_prodi?: string;
  prodi_id?: string;
};

export default function SNBPPage() {
  const [siswa, setSiswa] = useState<SiswaCache | null>(null);
  const [loading, setLoading] = useState(true);
  const [hitungLoading, setHitungLoading] = useState(false);
  const [hasil, setHasil] = useState<HasilPrediksi | null>(null);
  const [error, setError] = useState('');

  useEffect(() => {
    const cached = localStorage.getItem('mantra_siswa');
    if (cached) {
      try {
        setSiswa(JSON.parse(cached));
      } catch {
        setError('Data siswa di browser rusak. Isi ulang Data Diri.');
      }
    }
    setLoading(false);
  }, []);

  async function hitungPrediksi() {
    if (!siswa) return;
    setHitungLoading(true);
    setError('');
    setHasil(null);

    try {
      const { data: siswaData, error: errSiswa } = await supabase
        .from('siswa')
        .select('*, sekolah:sekolah_id(akreditasi)')
        .eq('id', siswa.id)
        .single();

      if (errSiswa) throw new Error('Siswa: ' + errSiswa.message);
      if (!siswaData) throw new Error('Data siswa tidak ditemukan.');

      const { data: raporData, error: errRapor } = await supabase
        .from('nilai_rapor')
        .select('semester, mapel, nilai')
        .eq('siswa_id', siswa.id);

      if (errRapor) throw new Error('Rapor: ' + errRapor.message);
      if (!raporData || raporData.length === 0) {
        throw new Error('Data rapor kosong. Isi Rapor terlebih dahulu.');
      }

      const { data: prestasiData } = await supabase
        .from('prestasi')
        .select('level, peringkat, relevan_prodi')
        .eq('siswa_id', siswa.id);

      const { data: pilihanData, error: errPilihan } = await supabase
        .from('pilihan_siswa')
        .select(
          'urutan, prodi:prodi_id(id, nama, rumpun, mapel_pendukung, daya_tampung_snbp, peminat_snbp_historis, bobot_snbp, ptn:ptn_id(nama, singkatan))'
        )
        .eq('siswa_id', siswa.id)
        .eq('jalur', 'SNBP')
        .order('urutan');

      if (errPilihan) throw new Error('Pilihan: ' + errPilihan.message);
      if (!pilihanData || pilihanData.length === 0) {
        throw new Error('Belum ada pilihan prodi. Isi Data Diri dulu.');
      }

      const profile: SiswaProfile = {
        rapor: raporData.map((r: any) => ({
          semester: Number(r.semester),
          mapel: r.mapel,
          nilai: Number(r.nilai),
        })),
        prestasi: (prestasiData || []).map((p: any) => ({
          level: p.level,
          peringkat: p.peringkat,
          relevan_prodi: Boolean(p.relevan_prodi),
        })),
        skorTKA: siswaData.skor_tka ? Number(siswaData.skor_tka) : null,
        akreditasi: siswaData.sekolah?.akreditasi || siswa.akreditasi || 'A',
        indeksSekolahDiPTN: INDEKS_SEKOLAH_DEFAULT,
        peringkatKelas:
          siswaData.peringkat_kelas_paralel !== null
            ? Number(siswaData.peringkat_kelas_paralel)
            : null,
        jumlahEligible:
          siswaData.jumlah_siswa_eligible !== null
            ? Number(siswaData.jumlah_siswa_eligible)
            : null,
      };

      const pilihan: ProdiPilihan[] = pilihanData.map((row: any) => {
        const prodi = Array.isArray(row.prodi) ? row.prodi[0] : row.prodi;
        if (!prodi) throw new Error('Data prodi tidak ditemukan.');
        const ptn = Array.isArray(prodi.ptn) ? prodi.ptn[0] : prodi.ptn;

        return {
          id: prodi.id,
          nama: prodi.nama,
          universitas: ptn?.singkatan || ptn?.nama || '-',
          dayaTampung:
            Number(prodi.daya_tampung_snbp) || DEFAULT_DAYA_TAMPUNG_SNBP,
          peminatHistoris:
            Array.isArray(prodi.peminat_snbp_historis) &&
            prodi.peminat_snbp_historis.length > 0
              ? prodi.peminat_snbp_historis.map(Number)
              : DEFAULT_PEMINAT_HISTORIS,
          mapelPendukung: prodi.mapel_pendukung || [],
          bobotSNBP: prodi.bobot_snbp || undefined,
          medianPelamar:
            Number(prodi.bobot_snbp?.median_snbp) || DEFAULT_MEDIAN_SNBP,
        };
      });

      const result = prediksiSNBP({
        siswa: profile,
        pilihan,
        disclaimer: DISCLAIMER_TEXT,
      });

      setHasil(result);
    } catch (err: any) {
      setError(err?.message || 'Terjadi kesalahan saat menghitung prediksi.');
    } finally {
      setHitungLoading(false);
    }
  }

  if (loading) {
    return (
      <div className="text-center text-muted-foreground py-12">Memuat...</div>
    );
  }

  if (!siswa) {
    return (
      <div className="bg-card border border-border rounded-2xl p-6 text-center space-y-4">
        <div className="text-5xl">⚠️</div>
        <h2 className="text-xl font-bold">Data Diri Belum Diisi</h2>
        <Link href="/">
          <Button className="bg-primary hover:bg-primary/90">
            ← Kembali ke Data Diri
          </Button>
        </Link>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <div className="bg-card border border-border rounded-2xl p-4">
        <p className="text-xs text-muted-foreground">Prediksi SNBP untuk</p>
        <p className="font-bold">{siswa.nama}</p>
        <p className="text-xs text-muted-foreground">🎯 {siswa.target_prodi}</p>
      </div>

      {!hasil && (
        <div className="bg-card border border-border rounded-2xl p-6 text-center space-y-4">
          <div className="text-5xl">🔮</div>
          <h2 className="text-lg font-bold">Siap Hitung Prediksi?</h2>
          <p className="text-muted-foreground text-sm">
            Sistem akan menganalisis rapor, prestasi, sekolah, dan keketatan
            prodi untuk menghitung peluang lolosmu.
          </p>
          <Button
            onClick={hitungPrediksi}
            disabled={hitungLoading}
            className="w-full bg-primary hover:bg-primary/90 font-semibold py-6"
          >
            {hitungLoading ? 'Menghitung...' : '🚀 Hitung Prediksi SNBP'}
          </Button>
        </div>
      )}

      {error && (
        <div className="bg-red-900/20 border border-red-500/30 rounded-xl p-3 text-sm text-red-300">
          ❌ {error}
        </div>
      )}

      {hasil && (
        <>
          <HasilPrediksiView hasil={hasil} />

          <div className="grid grid-cols-2 gap-2">
            <Link href="/snbt">
              <Button
                variant="outline"
                className="w-full border-border text-xs py-5"
              >
                📝 Coba Prediksi SNBT
              </Button>
            </Link>
            <Link href="/chat">
              <Button
                variant="outline"
                className="w-full border-border text-xs py-5"
              >
                💬 Curhat ke MANTRA Care
              </Button>
            </Link>
          </div>
        </>
      )}
    </div>
  );
}
