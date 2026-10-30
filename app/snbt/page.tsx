'use client';

import { useEffect, useMemo, useState } from 'react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';
import { ProdiSearch, type Prodi } from '@/components/ProdiSearch';
import {
  prediksiSNBT,
  type ProdiPilihan,
  type HasilPrediksi,
} from '@/lib/prediction';
import {
  DISCLAIMER_TEXT,
  SUBTES_SNBT,
  SKOR_SUBTES_MIN,
  SKOR_SUBTES_MAX,
  MAX_PILIHAN_SNBT,
  DEFAULT_DAYA_TAMPUNG_SNBT,
  DEFAULT_MEDIAN_SNBT,
  DEFAULT_PEMINAT_HISTORIS,
} from '@/lib/config';
import { hitungSkorUTBK } from '@/lib/scoring';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { HasilPrediksiView } from '@/components/HasilPrediksi';

type SiswaCache = {
  id: string;
  nama: string;
  kelas?: string;
  target_prodi?: string;
};

function buatSkorKosong(): Record<string, string> {
  return SUBTES_SNBT.reduce(
    (acc, s) => {
      acc[s.kode] = '';
      return acc;
    },
    {} as Record<string, string>
  );
}

export default function SNBTPage() {
  const [siswa, setSiswa] = useState<SiswaCache | null>(null);
  const [loading, setLoading] = useState(true);
  const [hitungLoading, setHitungLoading] = useState(false);
  const [skor, setSkor] = useState<Record<string, string>>(buatSkorKosong);
  const [pilihan, setPilihan] = useState<Prodi[]>([]);
  const [hasil, setHasil] = useState<HasilPrediksi | null>(null);
  const [error, setError] = useState('');
  const [info, setInfo] = useState('');

  useEffect(() => {
    let aktif = true;

    async function init() {
      const cached = localStorage.getItem('mantra_siswa');
      if (!cached) {
        if (aktif) setLoading(false);
        return;
      }

      try {
        const parsed: SiswaCache = JSON.parse(cached);
        if (!aktif) return;
        setSiswa(parsed);

        const savedSkor = localStorage.getItem('mantra_snbt_skor');
        if (savedSkor) {
          const parsedSkor = JSON.parse(savedSkor);
          const next = buatSkorKosong();
          for (const s of SUBTES_SNBT) {
            if (
              parsedSkor[s.kode] !== undefined &&
              parsedSkor[s.kode] !== null
            ) {
              next[s.kode] = String(parsedSkor[s.kode]);
            }
          }
          if (aktif) setSkor(next);
        }

        await muatPilihan(parsed.id, aktif);
      } catch {
        if (aktif) {
          setError('Data siswa di browser rusak. Isi ulang Data Diri.');
        }
      } finally {
        if (aktif) setLoading(false);
      }
    }

    init();
    return () => {
      aktif = false;
    };
  }, []);

  async function muatPilihan(siswaId: string, aktif = true) {
    const { data, error: err } = await supabase
      .from('pilihan_siswa')
      .select(
        'urutan, prodi:prodi_id(id, nama, rumpun, mapel_pendukung, daya_tampung_snbp, daya_tampung_snbt, peminat_snbp_historis, peminat_snbt_historis, median_snbp, median_snbt, ptn:ptn_id(nama, singkatan))'
      )
      .eq('siswa_id', siswaId)
      .eq('jalur', 'SNBT')
      .order('urutan');

    if (err) {
      if (aktif) {
        setInfo(
          'Pilihan prodi lama belum bisa dimuat. Kamu tetap bisa memilih prodi baru.'
        );
      }
      return;
    }

    if (!data || !aktif) return;

    const rows: Prodi[] = [];
    for (const row of data as any[]) {
      const prodi = Array.isArray(row.prodi) ? row.prodi[0] : row.prodi;
      if (!prodi) continue;
      const ptn = Array.isArray(prodi.ptn) ? prodi.ptn[0] : prodi.ptn;

      rows.push({
        id: prodi.id,
        prodi: prodi.nama,
        universitas: ptn?.nama || '-',
        singkatan: ptn?.singkatan || '-',
        rumpun: prodi.rumpun || '-',
        mapel_pendukung: prodi.mapel_pendukung || [],
        daya_tampung_snbp: Number(prodi.daya_tampung_snbp) || 0,
        daya_tampung_snbt: Number(prodi.daya_tampung_snbt) || 0,
        peminat_snbp_historis: prodi.peminat_snbp_historis || [],
        peminat_snbt_historis: prodi.peminat_snbt_historis || [],
        median_snbp:
          prodi.median_snbp !== null && prodi.median_snbp !== undefined
            ? Number(prodi.median_snbp)
            : null,
        median_snbt:
          prodi.median_snbt !== null && prodi.median_snbt !== undefined
            ? Number(prodi.median_snbt)
            : null,
      });
    }

    setPilihan(rows.slice(0, MAX_PILIHAN_SNBT));
  }

  const skorNumerik = useMemo(() => {
    const result: Record<string, number> = {};
    for (const s of SUBTES_SNBT) {
      const raw = skor[s.kode];
      if (raw === '' || raw === undefined) continue;
      const n = Number(raw);
      if (Number.isFinite(n)) result[s.kode] = n;
    }
    return result;
  }, [skor]);

  const jumlahTerisi = Object.keys(skorNumerik).length;
  const semuaValid =
    jumlahTerisi === SUBTES_SNBT.length &&
    SUBTES_SNBT.every(
      (s) =>
        skorNumerik[s.kode] >= SKOR_SUBTES_MIN &&
        skorNumerik[s.kode] <= SKOR_SUBTES_MAX
    );
  const komposit = semuaValid ? hitungSkorUTBK(skorNumerik) : null;
  const rataSubtes =
    jumlahTerisi > 0
      ? Math.round(
          Object.values(skorNumerik).reduce((a, b) => a + b, 0) / jumlahTerisi
        )
      : null;

  function updateSkor(kode: string, value: string) {
    setSkor((prev) => ({ ...prev, [kode]: value }));
    setHasil(null);
  }

  function tambahProdi(prodi: Prodi | null) {
    if (!prodi) return;
    setInfo('');
    setError('');
    if (pilihan.some((p) => p.id === prodi.id)) {
      setError('Prodi itu sudah ada di daftar pilihanmu.');
      return;
    }
    if (pilihan.length >= MAX_PILIHAN_SNBT) {
      setError(`Maksimal ${MAX_PILIHAN_SNBT} pilihan prodi.`);
      return;
    }
    setPilihan((prev) => [...prev, prodi]);
    setHasil(null);
  }

  function hapusProdi(id: string) {
    setPilihan((prev) => prev.filter((p) => p.id !== id));
    setHasil(null);
  }

  async function simpanPilihan(siswaId: string) {
    const { error: errHapus } = await supabase
      .from('pilihan_siswa')
      .delete()
      .eq('siswa_id', siswaId)
      .eq('jalur', 'SNBT');

    if (errHapus) throw new Error(errHapus.message);

    const rows = pilihan.map((p, i) => ({
      siswa_id: siswaId,
      prodi_id: p.id,
      jalur: 'SNBT',
      urutan: i + 1,
    }));

    const { error: errSimpan } = await supabase
      .from('pilihan_siswa')
      .insert(rows);

    if (errSimpan) throw new Error(errSimpan.message);
  }

  async function handleHitung() {
    if (!siswa) {
      setError('Isi Data Diri dulu sebelum menghitung.');
      return;
    }

    setError('');
    setInfo('');

    const nilai: Record<string, number> = {};
    for (const s of SUBTES_SNBT) {
      const raw = skor[s.kode];
      if (raw === '' || raw === undefined) {
        setError(`Skor ${s.nama} belum diisi.`);
        return;
      }
      const n = Number(raw);
      if (
        !Number.isFinite(n) ||
        n < SKOR_SUBTES_MIN ||
        n > SKOR_SUBTES_MAX
      ) {
        setError(
          `Skor ${s.nama} harus di antara ${SKOR_SUBTES_MIN}-${SKOR_SUBTES_MAX}.`
        );
        return;
      }
      nilai[s.kode] = n;
    }

    if (pilihan.length === 0) {
      setError('Pilih minimal 1 prodi tujuan.');
      return;
    }

    setHitungLoading(true);
    setHasil(null);

    try {
      localStorage.setItem('mantra_snbt_skor', JSON.stringify(nilai));

      const pilihanProdi: ProdiPilihan[] = pilihan.map((p) => ({
        id: p.id,
        nama: p.prodi,
        universitas: p.singkatan || p.universitas,
        dayaTampung:
          p.daya_tampung_snbt > 0
            ? p.daya_tampung_snbt
            : DEFAULT_DAYA_TAMPUNG_SNBT,
        peminatHistoris:
          p.peminat_snbt_historis && p.peminat_snbt_historis.length > 0
            ? p.peminat_snbt_historis
            : DEFAULT_PEMINAT_HISTORIS,
        mapelPendukung: p.mapel_pendukung || [],
        medianPelamar:
          p.median_snbt !== null && p.median_snbt !== undefined
            ? p.median_snbt
            : DEFAULT_MEDIAN_SNBT,
      }));

      const result = prediksiSNBT({
        skorSubtes: nilai,
        pilihan: pilihanProdi,
        disclaimer: DISCLAIMER_TEXT,
      });

      setHasil(result);

      try {
        await simpanPilihan(siswa.id);
      } catch {
        setInfo(
          'Hasil sudah dihitung, tapi pilihan gagal disimpan ke database. Coba simpan ulang nanti.'
        );
      }
    } catch (err: any) {
      setError(err?.message || 'Gagal menghitung prediksi SNBT.');
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
        <p className="text-muted-foreground text-sm">
          Isi Data Diri dulu supaya prediksi SNBT bisa dikaitkan dengan profilmu.
        </p>
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
        <p className="text-xs text-muted-foreground">Prediksi SNBT untuk</p>
        <p className="font-bold">{siswa.nama}</p>
        <p className="text-xs text-muted-foreground">🎯 {siswa.target_prodi}</p>
      </div>

      <div className="bg-card border border-border rounded-2xl p-4 sm:p-6">
        <div className="flex items-start justify-between gap-3">
          <div>
            <h2 className="text-lg font-bold">📝 Skor UTBK</h2>
            <p className="text-muted-foreground text-xs mt-1">
              Isi 7 subtes SNBT (skala 0-1000). Belum punya nilai? Pakai skor
              tryout terakhirmu.
            </p>
          </div>
          <div className="text-right shrink-0">
            <p className="text-[9px] text-muted-foreground">KOMPOSIT</p>
            <p className="text-2xl font-extrabold text-primary">
              {komposit ?? '—'}
            </p>
            <p className="text-[9px] text-muted-foreground">
              {rataSubtes !== null ? `rata-rata ${rataSubtes}` : '7 subtes'}
            </p>
          </div>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 mt-4">
          {SUBTES_SNBT.map((s) => (
            <div
              key={s.kode}
              className="bg-secondary border border-border rounded-xl p-3"
            >
              <div className="flex items-center justify-between gap-2">
                <Label className="text-xs font-semibold">{s.nama}</Label>
                <span className="text-[9px] font-bold px-2 py-0.5 rounded-full bg-primary/15 text-primary">
                  {s.kode}
                </span>
              </div>
              <p className="text-[10px] text-muted-foreground mt-1 mb-2 leading-snug">
                {s.deskripsi}
              </p>
              <div className="relative">
                <Input
                  type="number"
                  inputMode="numeric"
                  min={SKOR_SUBTES_MIN}
                  max={SKOR_SUBTES_MAX}
                  value={skor[s.kode]}
                  onChange={(e) => updateSkor(s.kode, e.target.value)}
                  placeholder="0"
                  className="bg-card border-border pr-14 text-sm font-semibold"
                />
                <span className="absolute right-3 top-1/2 -translate-y-1/2 text-[10px] text-muted-foreground">
                  /1000
                </span>
              </div>
            </div>
          ))}
        </div>

        <div className="flex justify-between text-[10px] text-muted-foreground mt-3">
          <span>{jumlahTerisi}/7 subtes terisi</span>
          <span>Skor komposit = jumlah terbobot 7 subtes</span>
        </div>
      </div>

      <div className="bg-card border border-border rounded-2xl p-4 sm:p-6">
        <div className="flex items-start justify-between gap-3">
          <div>
            <h2 className="text-lg font-bold">🎯 Pilihan Prodi</h2>
            <p className="text-muted-foreground text-xs mt-1">
              Pilih 1-{MAX_PILIHAN_SNBT} prodi. Urutan mempengaruhi peluang
              (pilihan 2-4 kena penalti).
            </p>
          </div>
          <span className="text-xs font-bold text-primary shrink-0">
            {pilihan.length}/{MAX_PILIHAN_SNBT}
          </span>
        </div>

        {pilihan.length > 0 && (
          <div className="space-y-2 mt-4">
            {pilihan.map((p, idx) => (
              <div
                key={p.id}
                className="flex items-center gap-2 bg-secondary border border-border rounded-xl p-3"
              >
                <div className="w-6 h-6 rounded-full bg-primary/20 text-primary text-xs font-bold flex items-center justify-center shrink-0">
                  {idx + 1}
                </div>
                <div className="min-w-0 flex-1">
                  <p className="font-semibold text-sm truncate">{p.prodi}</p>
                  <p className="text-[10px] text-muted-foreground truncate">
                    {p.universitas} · SNBT {p.daya_tampung_snbt} kursi
                  </p>
                </div>
                <button
                  onClick={() => hapusProdi(p.id)}
                  className="text-red-400 hover:text-red-300 text-xs px-1"
                  title="Hapus pilihan"
                >
                  ✕
                </button>
              </div>
            ))}
          </div>
        )}

        {pilihan.length < MAX_PILIHAN_SNBT && (
          <div className="mt-4">
            <ProdiSearch value={null} onChange={tambahProdi} />
          </div>
        )}
      </div>

      <Button
        onClick={handleHitung}
        disabled={hitungLoading}
        className="w-full bg-primary hover:bg-primary/90 font-semibold py-6"
      >
        {hitungLoading ? 'Menghitung...' : '🚀 Hitung Prediksi SNBT'}
      </Button>

      {error && (
        <div className="bg-red-900/20 border border-red-500/30 rounded-xl p-3 text-sm text-red-300">
          ❌ {error}
        </div>
      )}

      {info && (
        <div className="bg-yellow-900/20 border border-yellow-500/30 rounded-xl p-3 text-xs text-yellow-200/90">
          ℹ️ {info}
        </div>
      )}

      {hasil && (
        <>
          <HasilPrediksiView hasil={hasil} />

          <div className="grid grid-cols-2 gap-2">
            <Link href="/snbp">
              <Button
                variant="outline"
                className="w-full border-border text-xs py-5"
              >
                🎓 Lihat SNBP
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
