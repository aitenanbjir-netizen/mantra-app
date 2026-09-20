'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';
import { hitungSkorSNBP } from '@/lib/logic';
import { LikertScale } from '@/components/LikertScale';
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

type SiswaCache = {
  id: string;
  nama: string;
  kelas: string;
  target_prodi: string;
};

const mapelPerKelompok: Record<string, string[]> = {
  Saintek: ['Matematika', 'Fisika', 'Kimia', 'Biologi', 'Informatika'],
  Soshum: ['Ekonomi', 'Sosiologi', 'Sejarah', 'Geografi', 'Matematika'],
  Bahasa: ['Bahasa Indonesia', 'Bahasa Inggris', 'Bahasa Asing'],
  Campuran: [
    'Matematika',
    'Fisika',
    'Kimia',
    'Biologi',
    'Ekonomi',
    'Sosiologi',
    'Sejarah',
    'Geografi',
    'Bahasa Indonesia',
    'Bahasa Inggris',
  ],
};

export default function SNBPPage() {
  const [siswa, setSiswa] = useState<SiswaCache | null>(null);
  const [loading, setLoading] = useState(true);
  const [submitLoading, setSubmitLoading] = useState(false);

  const [kelompok, setKelompok] = useState('');
  const [mapelTKA1, setMapelTKA1] = useState('');
  const [mapelTKA2, setMapelTKA2] = useState('');
  const [rataRapor, setRataRapor] = useState('');
  const [nilaiTKA1, setNilaiTKA1] = useState('');
  const [nilaiTKA2, setNilaiTKA2] = useState('');
  const [stres, setStres] = useState(3);

  const [hasil, setHasil] = useState<{
    skor: number;
    rekomendasi: string;
  } | null>(null);

  useEffect(() => {
    const cached = localStorage.getItem('mantra_siswa');
    if (cached) setSiswa(JSON.parse(cached));
    setLoading(false);
  }, []);

  const listMapel = kelompok ? mapelPerKelompok[kelompok] || [] : [];

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!siswa) return;

    if (!kelompok || !mapelTKA1 || !mapelTKA2) {
      alert('⚠️ Lengkapi Kelompok & 2 Mapel TKA!');
      return;
    }
    if (!rataRapor || !nilaiTKA1 || !nilaiTKA2) {
      alert('⚠️ Isi semua nilai!');
      return;
    }

    const rr = parseFloat(rataRapor);
    const n1 = parseFloat(nilaiTKA1);
    const n2 = parseFloat(nilaiTKA2);

    if (rr < 0 || rr > 100 || n1 < 0 || n1 > 100 || n2 < 0 || n2 > 100) {
      alert('⚠️ Nilai harus 0-100!');
      return;
    }

    setSubmitLoading(true);

    const skor = hitungSkorSNBP(rr, n1, n2);

    let rek = '';
    if (skor >= 85) rek = '🌟 Skor SNBP sangat baik! Peluang besar lolos SNBP.';
    else if (skor >= 75) rek = '😊 Skor SNBP cukup baik. Pertahankan & tingkatkan TKA.';
    else rek = '📚 Skor SNBP masih di bawah 75. Fokus perbaiki nilai rapor & TKA.';

    const { error } = await supabase
      .from('siswa')
      .update({
        kelompok,
        mapel_tka_1: mapelTKA1,
        mapel_tka_2: mapelTKA2,
        rata_rapor: rr,
        nilai_tka_1: n1,
        nilai_tka_2: n2,
        skor_snbp: skor,
      })
      .eq('id', siswa.id);

    await supabase.from('log_prediksi').insert({
      siswa_id: siswa.id,
      jenis: 'SNBP',
      skor: skor,
      stres: stres,
      rekomendasi: rek,
    });

    setSubmitLoading(false);

    if (error) {
      alert('❌ Error: ' + error.message);
    } else {
      setHasil({ skor, rekomendasi: rek });
    }
  }

  if (loading) {
    return <div className="text-center text-muted-foreground py-12">Memuat...</div>;
  }

  if (!siswa) {
    return (
      <div className="bg-card border border-border rounded-2xl p-6 text-center space-y-4">
        <div className="text-5xl">⚠️</div>
        <h2 className="text-xl font-bold">Data Diri Belum Diisi</h2>
        <p className="text-muted-foreground text-sm">
          Silakan isi Data Diri terlebih dahulu.
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
      <div className="bg-card border border-border rounded-2xl p-6">
        <div className="mb-4 pb-4 border-b border-border">
          <p className="text-xs text-muted-foreground">Halo,</p>
          <p className="text-lg font-bold">{siswa.nama}</p>
          <p className="text-xs text-muted-foreground">
            🎯 {siswa.target_prodi}
          </p>
        </div>

        <h2 className="text-xl font-bold mb-1">Prediksi SNBP</h2>
        <p className="text-muted-foreground text-xs mb-6">
          Bobot 50% Rata-rata Rapor + 50% 2 Mapel TKA
        </p>

        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <Label className="mb-2 block text-sm">🧭 Kelompok Jurusan</Label>
            <Select
              value={kelompok}
              onValueChange={(v) => {
                setKelompok(v);
                setMapelTKA1('');
                setMapelTKA2('');
              }}
            >
              <SelectTrigger className="bg-secondary border-border">
                <SelectValue placeholder="-- Pilih Kelompok --" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="Saintek">Saintek (IPA)</SelectItem>
                <SelectItem value="Soshum">Soshum (IPS)</SelectItem>
                <SelectItem value="Bahasa">Bahasa</SelectItem>
                <SelectItem value="Campuran">Campuran</SelectItem>
              </SelectContent>
            </Select>
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div>
              <Label className="mb-2 block text-xs">📖 Mapel TKA 1</Label>
              <Select
                value={mapelTKA1}
                onValueChange={setMapelTKA1}
                disabled={!kelompok}
              >
                <SelectTrigger className="bg-secondary border-border">
                  <SelectValue placeholder="-- Pilih --" />
                </SelectTrigger>
                <SelectContent>
                  {listMapel.map((m) => (
                    <SelectItem key={m} value={m}>
                      {m}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label className="mb-2 block text-xs">📖 Mapel TKA 2</Label>
              <Select
                value={mapelTKA2}
                onValueChange={setMapelTKA2}
                disabled={!kelompok}
              >
                <SelectTrigger className="bg-secondary border-border">
                  <SelectValue placeholder="-- Pilih --" />
                </SelectTrigger>
                <SelectContent>
                  {listMapel.map((m) => (
                    <SelectItem key={m} value={m}>
                      {m}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          </div>

          <div>
            <Label className="mb-2 block text-sm">
              📈 Rata-rata Rapor Sem 1-5
            </Label>
            <Input
              type="number"
              min={0}
              max={100}
              step="0.01"
              value={rataRapor}
              onChange={(e) => setRataRapor(e.target.value)}
              placeholder="0-100"
              className="bg-secondary border-border"
            />
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div>
              <Label className="mb-2 block text-xs">Nilai TKA 1</Label>
              <Input
                type="number"
                min={0}
                max={100}
                value={nilaiTKA1}
                onChange={(e) => setNilaiTKA1(e.target.value)}
                placeholder="0-100"
                className="bg-secondary border-border"
              />
            </div>
            <div>
              <Label className="mb-2 block text-xs">Nilai TKA 2</Label>
              <Input
                type="number"
                min={0}
                max={100}
                value={nilaiTKA2}
                onChange={(e) => setNilaiTKA2(e.target.value)}
                placeholder="0-100"
                className="bg-secondary border-border"
              />
            </div>
          </div>

          <div>
            <Label className="mb-3 block text-sm">
              🧠 Tingkat Stres Hari Ini
            </Label>
            <LikertScale value={stres} onChange={setStres} />
          </div>

          <Button
            type="submit"
            disabled={submitLoading}
            className="w-full bg-primary hover:bg-primary/90 text-primary-foreground font-semibold py-6"
          >
            {submitLoading ? 'Menghitung...' : '🚀 Hitung Skor SNBP'}
          </Button>
        </form>
      </div>

      {hasil && (
        <div className="bg-card border border-primary/30 rounded-2xl p-6 space-y-3">
          <div className="text-center bg-primary/10 border border-primary/30 rounded-xl p-4">
            <p className="text-xs text-muted-foreground mb-1">SKOR SNBP</p>
            <p className="text-4xl font-extrabold text-primary">{hasil.skor}</p>
            <p className="text-[10px] text-muted-foreground mt-1">
              50% Rapor + 50% Mapel TKA
            </p>
          </div>

          <div className="bg-secondary border border-border rounded-xl p-3">
            <p className="text-xs text-muted-foreground mb-1">💬 Rekomendasi</p>
            <p className="text-sm">{hasil.rekomendasi}</p>
          </div>

          <Link href="/snbt">
            <Button className="w-full bg-primary hover:bg-primary/90">
              Lanjut ke SNBT →
            </Button>
          </Link>
        </div>
      )}
    </div>
  );
}