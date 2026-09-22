'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';

const DEFAULT_MAPEL = [
  'Pendidikan Agama',
  'PPKn',
  'Bahasa Indonesia',
  'Matematika',
  'Bahasa Inggris',
  'Sejarah Indonesia',
  'PJOK',
  'Seni Budaya',
  'Prakarya',
];

type MapelRow = {
  nama: string;
  nilai: (number | '')[];
};

export default function RaporPage() {
  const router = useRouter();
  const [siswa, setSiswa] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [submitLoading, setSubmitLoading] = useState(false);
  const [message, setMessage] = useState('');

  const [mapelList, setMapelList] = useState<MapelRow[]>(
    DEFAULT_MAPEL.map((m) => ({ nama: m, nilai: ['', '', '', '', ''] }))
  );
  const [newMapelName, setNewMapelName] = useState('');

  useEffect(() => {
    const cached = localStorage.getItem('mantra_siswa');
    if (cached) {
      const parsed = JSON.parse(cached);
      setSiswa(parsed);
      loadExistingRapor(parsed.id);
    } else {
      setLoading(false);
    }
  }, []);

  async function loadExistingRapor(siswaId: string) {
    const { data } = await supabase
      .from('nilai_rapor')
      .select('*')
      .eq('siswa_id', siswaId);

    if (data && data.length > 0) {
      const mapelMap: Record<string, (number | '')[]> = {};
      data.forEach((row: any) => {
        if (!mapelMap[row.mapel]) mapelMap[row.mapel] = ['', '', '', '', ''];
        mapelMap[row.mapel][row.semester - 1] = Number(row.nilai);
      });
      const restored = Object.entries(mapelMap).map(([nama, nilai]) => ({
        nama,
        nilai,
      }));
      if (restored.length > 0) setMapelList(restored);
    }
    setLoading(false);
  }

  function updateNilai(idx: number, semester: number, val: string) {
    const num = val === '' ? '' : Math.max(0, Math.min(100, Number(val)));
    setMapelList((prev) => {
      const copy = [...prev];
      copy[idx] = { ...copy[idx], nilai: [...copy[idx].nilai] };
      copy[idx].nilai[semester] = num;
      return copy;
    });
  }

  function hapusMapel(idx: number) {
    setMapelList((prev) => prev.filter((_, i) => i !== idx));
  }

  function tambahMapel() {
    if (!newMapelName.trim()) return;
    setMapelList((prev) => [
      ...prev,
      { nama: newMapelName.trim(), nilai: ['', '', '', '', ''] },
    ]);
    setNewMapelName('');
  }

  const rataPerSemester = [0, 1, 2, 3, 4].map((s) => {
    const nilai = mapelList
      .map((m) => m.nilai[s])
      .filter((v) => v !== '' && typeof v === 'number') as number[];
    if (nilai.length === 0) return 0;
    return (
      Math.round((nilai.reduce((a, b) => a + b, 0) / nilai.length) * 100) / 100
    );
  });

  const allNilai = mapelList
    .flatMap((m) => m.nilai)
    .filter((v) => v !== '' && typeof v === 'number') as number[];
  const rataKeseluruhan =
    allNilai.length > 0
      ? Math.round(
          (allNilai.reduce((a, b) => a + b, 0) / allNilai.length) * 100
        ) / 100
      : 0;

  async function handleSubmit() {
    if (!siswa) return;

    const emptyRows = mapelList.filter((m) => m.nilai.every((v) => v === ''));
    if (emptyRows.length > 0) {
      setMessage(`⚠️ Mapel "${emptyRows[0].nama}" belum diisi!`);
      return;
    }

    const incomplete = mapelList.find((m) => m.nilai.some((v) => v === ''));
    if (incomplete) {
      setMessage(
        `⚠️ Mapel "${incomplete.nama}" belum lengkap 5 semester!`
      );
      return;
    }

    setSubmitLoading(true);
    setMessage('');

    try {
      await supabase
        .from('nilai_rapor')
        .delete()
        .eq('siswa_id', siswa.id);

      const rows = mapelList.flatMap((m) =>
        m.nilai.map((val, idx) => ({
          siswa_id: siswa.id,
          semester: idx + 1,
          mapel: m.nama,
          nilai: Number(val),
        }))
      );

      const { error } = await supabase.from('nilai_rapor').insert(rows);
      if (error) throw error;

      setMessage(`✅ ${rows.length} nilai tersimpan!`);
    } catch (err: any) {
      setMessage('❌ Error: ' + err.message);
    } finally {
      setSubmitLoading(false);
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
          Silakan isi Data Diri terlebih dahulu.
        </p>
        <Button
          onClick={() => router.push('/')}
          className="bg-primary hover:bg-primary/90"
        >
          ← Kembali ke Data Diri
        </Button>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      {/* Info Siswa */}
      <div className="bg-card border border-border rounded-2xl p-4">
        <p className="text-xs text-muted-foreground">Mengisi rapor untuk</p>
        <p className="font-bold">{siswa.nama}</p>
        <p className="text-xs text-muted-foreground">🎯 {siswa.target_prodi}</p>
      </div>

      {/* Ringkasan */}
      <div className="bg-primary/10 border border-primary/30 rounded-2xl p-4 grid grid-cols-3 gap-2 text-center">
        <div>
          <p className="text-[10px] text-muted-foreground">Rata-rata</p>
          <p className="text-2xl font-extrabold text-primary">
            {rataKeseluruhan}
          </p>
        </div>
        <div>
          <p className="text-[10px] text-muted-foreground">Mapel</p>
          <p className="text-2xl font-extrabold">{mapelList.length}</p>
        </div>
        <div>
          <p className="text-[10px] text-muted-foreground">Total Nilai</p>
          <p className="text-2xl font-extrabold">{allNilai.length}</p>
        </div>
      </div>

      {/* Tabel Rapor */}
      <div className="bg-card border border-border rounded-2xl p-4">
        <h2 className="text-lg font-bold mb-1">📊 Nilai Rapor Semester 1-5</h2>
        <p className="text-muted-foreground text-xs mb-4">
          Isi nilai (0-100) untuk setiap mapel per semester.
        </p>

        <div className="grid grid-cols-[1fr_repeat(5,50px)_30px] gap-1 mb-2 text-[10px] text-muted-foreground font-semibold">
          <div>Mapel</div>
          <div className="text-center">S1</div>
          <div className="text-center">S2</div>
          <div className="text-center">S3</div>
          <div className="text-center">S4</div>
          <div className="text-center">S5</div>
          <div></div>
        </div>

        {mapelList.map((m, idx) => (
          <div
            key={idx}
            className="grid grid-cols-[1fr_repeat(5,50px)_30px] gap-1 mb-1 items-center"
          >
            <div className="text-xs truncate" title={m.nama}>
              {m.nama}
            </div>
            {m.nilai.map((v, s) => (
              <Input
                key={s}
                type="number"
                min={0}
                max={100}
                value={v}
                onChange={(e) => updateNilai(idx, s, e.target.value)}
                className="bg-secondary border-border h-8 text-xs text-center px-1"
                placeholder="0"
              />
            ))}
            <button
              onClick={() => hapusMapel(idx)}
              className="text-red-400 hover:text-red-300 text-xs"
              title="Hapus"
            >
              ✕
            </button>
          </div>
        ))}

        <div className="grid grid-cols-[1fr_repeat(5,50px)_30px] gap-1 mt-3 pt-3 border-t border-border items-center">
          <div className="text-[10px] font-bold text-muted-foreground">
            RATA-RATA
          </div>
          {rataPerSemester.map((r, i) => (
            <div
              key={i}
              className="text-center text-[10px] font-bold text-primary"
            >
              {r || '-'}
            </div>
          ))}
          <div></div>
        </div>

        <div className="flex gap-2 mt-4">
          <Input
            value={newMapelName}
            onChange={(e) => setNewMapelName(e.target.value)}
            placeholder="Nama mapel baru..."
            className="bg-secondary border-border text-sm"
            onKeyPress={(e) => e.key === 'Enter' && tambahMapel()}
          />
          <Button
            onClick={tambahMapel}
            variant="outline"
            className="border-border"
          >
            + Tambah
          </Button>
        </div>
      </div>

      <div className="space-y-3">
        <Button
          onClick={handleSubmit}
          disabled={submitLoading}
          className="w-full bg-primary hover:bg-primary/90 text-primary-foreground font-semibold py-6"
        >
          {submitLoading ? 'Menyimpan...' : '💾 Simpan Rapor'}
        </Button>

        {message && (
          <div className="p-3 rounded-xl bg-primary/10 border border-primary/30 text-sm">
            {message}
          </div>
        )}
      </div>
    </div>
  );
}