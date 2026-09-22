'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';

type PrestasiRow = {
  id?: string;
  nama: string;
  level: string;
  peringkat: string;
  bidang: string;
  relevan_prodi: boolean;
  tahun: string;
};

export default function PrestasiPage() {
  const router = useRouter();
  const [siswa, setSiswa] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [submitLoading, setSubmitLoading] = useState(false);
  const [message, setMessage] = useState('');
  const [prestasiList, setPrestasiList] = useState<PrestasiRow[]>([]);

  useEffect(() => {
    const cached = localStorage.getItem('mantra_siswa');
    if (cached) {
      const parsed = JSON.parse(cached);
      setSiswa(parsed);
      loadExisting(parsed.id);
    } else {
      setLoading(false);
    }
  }, []);

  async function loadExisting(siswaId: string) {
    const { data } = await supabase
      .from('prestasi')
      .select('*')
      .eq('siswa_id', siswaId);
    if (data && data.length > 0) {
      setPrestasiList(
        data.map((p: any) => ({
          id: p.id,
          nama: p.nama,
          level: p.level,
          peringkat: p.peringkat ? String(p.peringkat) : '',
          bidang: p.bidang,
          relevan_prodi: p.relevan_prodi,
          tahun: String(p.tahun || ''),
        }))
      );
    }
    setLoading(false);
  }

  function tambahPrestasi() {
    setPrestasiList((prev) => [
      ...prev,
      {
        nama: '',
        level: 'kabkota',
        peringkat: '',
        bidang: 'akademik',
        relevan_prodi: false,
        tahun: String(new Date().getFullYear()),
      },
    ]);
  }

  function hapusPrestasi(idx: number) {
    setPrestasiList((prev) => prev.filter((_, i) => i !== idx));
  }

  function updatePrestasi(idx: number, field: keyof PrestasiRow, val: any) {
    setPrestasiList((prev) => {
      const copy = [...prev];
      copy[idx] = { ...copy[idx], [field]: val };
      return copy;
    });
  }

  async function handleSubmit() {
    if (!siswa) return;
    setSubmitLoading(true);
    setMessage('');

    try {
      await supabase.from('prestasi').delete().eq('siswa_id', siswa.id);

      if (prestasiList.length > 0) {
        const rows = prestasiList
          .filter((p) => p.nama.trim() !== '')
          .map((p) => ({
            siswa_id: siswa.id,
            nama: p.nama,
            level: p.level,
            peringkat: p.peringkat ? Number(p.peringkat) : null,
            bidang: p.bidang,
            relevan_prodi: p.relevan_prodi,
            tahun: p.tahun ? Number(p.tahun) : null,
          }));
        if (rows.length > 0) {
          const { error } = await supabase.from('prestasi').insert(rows);
          if (error) throw error;
        }
      }

      setMessage(`✅ ${prestasiList.length} prestasi tersimpan!`);
      setTimeout(() => router.push('/snbp'), 1500);
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
        <Button
          onClick={() => router.push('/')}
          className="bg-primary hover:bg-primary/90"
        >
          ← Kembali
        </Button>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <div className="bg-card border border-border rounded-2xl p-4">
        <p className="text-xs text-muted-foreground">Prestasi untuk</p>
        <p className="font-bold">{siswa.nama}</p>
        <p className="text-xs text-muted-foreground">🎯 {siswa.target_prodi}</p>
      </div>

      <div className="bg-card border border-border rounded-2xl p-4">
        <h2 className="text-lg font-bold mb-1">🏆 Prestasi (Opsional)</h2>
        <p className="text-muted-foreground text-xs mb-4">
          Tambahkan lomba/sertifikat yang kamu punya. Kosongkan kalau tidak ada.
        </p>

        {prestasiList.length === 0 && (
          <div className="text-center py-6 text-muted-foreground text-sm">
            Belum ada prestasi. Klik tombol di bawah untuk menambah.
          </div>
        )}

        {prestasiList.map((p, idx) => (
          <div
            key={idx}
            className="bg-secondary border border-border rounded-xl p-3 mb-3 space-y-3"
          >
            <div className="flex justify-between items-center">
              <span className="text-xs font-bold">Prestasi #{idx + 1}</span>
              <button
                onClick={() => hapusPrestasi(idx)}
                className="text-red-400 hover:text-red-300 text-xs"
              >
                ✕ Hapus
              </button>
            </div>

            <div>
              <Label className="mb-1 block text-xs">Nama Lomba/Prestasi</Label>
              <Input
                value={p.nama}
                onChange={(e) => updatePrestasi(idx, 'nama', e.target.value)}
                placeholder="Cth: OSN Matematika"
                className="bg-card border-border text-sm"
              />
            </div>

            <div className="grid grid-cols-2 gap-2">
              <div>
                <Label className="mb-1 block text-xs">Tingkat</Label>
                <Select
                  value={p.level}
                  onValueChange={(v) => updatePrestasi(idx, 'level', v ?? 'kabkota')}
                >
                  <SelectTrigger className="bg-card border-border text-xs">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="internasional">Internasional</SelectItem>
                    <SelectItem value="nasional">Nasional</SelectItem>
                    <SelectItem value="provinsi">Provinsi</SelectItem>
                    <SelectItem value="kabkota">Kab/Kota</SelectItem>
                    <SelectItem value="kecamatan">Kecamatan</SelectItem>
                    <SelectItem value="sekolah">Sekolah</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div>
                <Label className="mb-1 block text-xs">Peringkat</Label>
                <Select
                  value={p.peringkat || 'none'}
                  onValueChange={(v) =>
                    updatePrestasi(idx, 'peringkat', v === 'none' ? '' : v)
                  }
                >
                  <SelectTrigger className="bg-card border-border text-xs">
                    <SelectValue placeholder="-" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="none">-</SelectItem>
                    <SelectItem value="1">Juara 1</SelectItem>
                    <SelectItem value="2">Juara 2</SelectItem>
                    <SelectItem value="3">Juara 3</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-2">
              <div>
                <Label className="mb-1 block text-xs">Bidang</Label>
                <Select
                  value={p.bidang}
                  onValueChange={(v) =>
                    updatePrestasi(idx, 'bidang', v ?? 'akademik')
                  }
                >
                  <SelectTrigger className="bg-card border-border text-xs">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="akademik">Akademik</SelectItem>
                    <SelectItem value="non-akademik">Non-Akademik</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div>
                <Label className="mb-1 block text-xs">Tahun</Label>
                <Input
                  type="number"
                  value={p.tahun}
                  onChange={(e) => updatePrestasi(idx, 'tahun', e.target.value)}
                  placeholder="2025"
                  className="bg-card border-border text-sm"
                />
              </div>
            </div>

            <label className="flex items-center gap-2 cursor-pointer">
              <input
                type="checkbox"
                checked={p.relevan_prodi}
                onChange={(e) =>
                  updatePrestasi(idx, 'relevan_prodi', e.target.checked)
                }
                className="w-4 h-4 accent-pink-500"
              />
              <span className="text-xs text-muted-foreground">
                Relevan dengan prodi tujuan
              </span>
            </label>
          </div>
        ))}

        <Button
          onClick={tambahPrestasi}
          variant="outline"
          className="w-full border-border mt-2"
        >
          + Tambah Prestasi
        </Button>
      </div>

      <div className="space-y-3">
        <Button
          onClick={handleSubmit}
          disabled={submitLoading}
          className="w-full bg-primary hover:bg-primary/90 text-primary-foreground font-semibold py-6"
        >
          {submitLoading ? 'Menyimpan...' : '💾 Simpan & Lanjut ke Prediksi SNBP →'}
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