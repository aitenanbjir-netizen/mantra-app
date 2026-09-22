'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';
import {
  prediksiSNBP,
  type SiswaProfile,
  type ProdiPilihan,
} from '@/lib/prediction';
import { DISCLAIMER_TEXT } from '@/lib/config';
import { Button } from '@/components/ui/button';

export default function SNBPPage() {
  const [siswa, setSiswa] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [hitungLoading, setHitungLoading] = useState(false);
  const [hasil, setHasil] = useState<any>(null);
  const [error, setError] = useState('');

  useEffect(() => {
    const cached = localStorage.getItem('mantra_siswa');
    if (cached) setSiswa(JSON.parse(cached));
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
          semester: r.semester,
          mapel: r.mapel,
          nilai: Number(r.nilai),
        })),
        prestasi: (prestasiData || []).map((p: any) => ({
          level: p.level,
          peringkat: p.peringkat,
          relevan_prodi: p.relevan_prodi,
        })),
        skorTKA: siswaData.skor_tka || null,
        akreditasi: siswaData.sekolah?.akreditasi || 'A',
        indeksSekolahDiPTN: 0.5,
        peringkatKelas: siswaData.peringkat_kelas_paralel,
        jumlahEligible: siswaData.jumlah_siswa_eligible,
      };

      const pilihan: ProdiPilihan[] = pilihanData.map((p: any) => {
        const prodi = Array.isArray(p.prodi) ? p.prodi[0] : p.prodi;
        const ptn = prodi?.ptn
          ? Array.isArray(prodi.ptn)
            ? prodi.ptn[0]
            : prodi.ptn
          : null;
        return {
          id: prodi.id,
          nama: prodi.nama,
          universitas: ptn?.singkatan || ptn?.nama || '-',
          dayaTampung: prodi.daya_tampung_snbp || 40,
          peminatHistoris: prodi.peminat_snbp_historis || [1000],
          mapelPendukung: prodi.mapel_pendukung || [],
          bobotSNBP: prodi.bobot_snbp,
          medianPelamar: 82,
        };
      });

      const result = prediksiSNBP({
        siswa: profile,
        pilihan,
        disclaimer: DISCLAIMER_TEXT,
      });

      setHasil(result);
    } catch (err: any) {
      setError(err.message);
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
          <div className="bg-primary/10 border border-primary/30 rounded-2xl p-6 text-center">
            <p className="text-xs text-muted-foreground mb-1">
              PELUANG LOLOS SNBP (TOTAL)
            </p>
            <p className="text-5xl font-extrabold text-primary mb-2">
              {Math.round(hasil.probabilitasTotal * 100)}%
            </p>
            <p className="text-xs text-muted-foreground">
              {hasil.pilihan.length} pilihan prodi
            </p>
          </div>

          {hasil.pilihan.map((p: any) => (
            <div
              key={p.urutan}
              className="bg-card border border-border rounded-2xl p-5 space-y-3"
            >
              <div className="flex justify-between items-start">
                <div className="flex-1">
                  <p className="text-[10px] text-muted-foreground">
                    PILIHAN {p.urutan}
                  </p>
                  <p className="font-bold text-sm">{p.prodiNama}</p>
                  <p className="text-xs text-muted-foreground">
                    {p.universitas}
                  </p>
                </div>
                <div
                  className="px-3 py-1 rounded-full text-[10px] font-bold"
                  style={{
                    background: p.kategoriWarna + '20',
                    color: p.kategoriWarna,
                  }}
                >
                  {p.kategoriLabel}
                </div>
              </div>

              <div className="grid grid-cols-3 gap-2 text-center">
                <div className="bg-secondary rounded-xl p-2">
                  <p className="text-[9px] text-muted-foreground">SKOR KAMU</p>
                  <p className="font-bold text-lg">{p.skorKomposit}</p>
                </div>
                <div className="bg-secondary rounded-xl p-2">
                  <p className="text-[9px] text-muted-foreground">
                    EST. CUTOFF
                  </p>
                  <p className="font-bold text-lg">{p.estimasiCutoff}</p>
                </div>
                <div className="bg-secondary rounded-xl p-2">
                  <p className="text-[9px] text-muted-foreground">PELUANG</p>
                  <p className="font-bold text-lg text-primary">
                    {Math.round(p.probabilitas * 100)}%
                  </p>
                </div>
              </div>

              <div className="text-center text-xs text-muted-foreground">
                Interval:{' '}
                <span className="text-foreground font-semibold">
                  {Math.round(p.intervalBawah * 100)}% -{' '}
                  {Math.round(p.intervalAtas * 100)}%
                </span>
              </div>

              {p.faktorPendorong.length > 0 && (
                <div className="bg-emerald-900/20 border border-emerald-500/20 rounded-xl p-3">
                  <p className="text-[10px] font-bold text-emerald-300 mb-2">
                    ✅ FAKTOR PENDORONG
                  </p>
                  {p.faktorPendorong.map((f: any, i: number) => (
                    <div key={i} className="flex justify-between text-xs py-0.5">
                      <span className="text-muted-foreground">{f.faktor}</span>
                      <span className="text-emerald-300 font-bold">
                        {f.kontribusi}
                      </span>
                    </div>
                  ))}
                </div>
              )}

              {p.faktorPenghambat.length > 0 && (
                <div className="bg-red-900/20 border border-red-500/20 rounded-xl p-3">
                  <p className="text-[10px] font-bold text-red-300 mb-2">
                    ⚠️ FAKTOR PENGHAMBAT
                  </p>
                  {p.faktorPenghambat.map((f: any, i: number) => (
                    <div key={i} className="flex justify-between text-xs py-0.5">
                      <span className="text-muted-foreground">{f.faktor}</span>
                      <span className="text-red-300 font-bold">
                        {f.kontribusi}
                      </span>
                    </div>
                  ))}
                </div>
              )}

              {p.saran.length > 0 && (
                <div className="bg-secondary rounded-xl p-3">
                  <p className="text-[10px] font-bold text-muted-foreground mb-2">
                    💡 SARAN
                  </p>
                  <ul className="text-xs text-muted-foreground space-y-1 list-disc list-inside">
                    {p.saran.map((s: string, i: number) => (
                      <li key={i}>{s}</li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
          ))}

          <div className="bg-yellow-900/20 border border-yellow-500/30 rounded-xl p-3 text-xs text-yellow-200/80 leading-relaxed">
            ⚠️ {hasil.disclaimer}
          </div>

          <p className="text-center text-[10px] text-muted-foreground">
            Model: {hasil.modelVersion} · Data: {hasil.dataVintage}
          </p>
        </>
      )}
    </div>
  );
}