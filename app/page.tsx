'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { ProdiSearch, type Prodi } from '@/components/ProdiSearch';
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

export default function Home() {
  const router = useRouter();

  const [nama, setNama] = useState('');
  const [kelas, setKelas] = useState('');
  const [peringkatKelas, setPeringkatKelas] = useState('');
  const [jumlahEligible, setJumlahEligible] = useState('');

  const [npsn, setNpsn] = useState('');
  const [namaSekolah, setNamaSekolah] = useState('');
  const [jenjang, setJenjang] = useState('SMA');
  const [akreditasi, setAkreditasi] = useState('A');

  const [prodi, setProdi] = useState<Prodi | null>(null);

  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState('');

  const daftarKelas = Array.from({ length: 10 }, (_, i) => `XII-${i + 1}`);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();

    if (!nama || !kelas) {
      setMessage('⚠️ Nama dan Kelas wajib diisi!');
      return;
    }
    if (!namaSekolah || !akreditasi) {
      setMessage('⚠️ Data sekolah wajib diisi!');
      return;
    }
    if (!prodi) {
      setMessage('⚠️ Pilih Target Prodi dulu!');
      return;
    }

    setLoading(true);
    setMessage('');

    try {
      let sekolahId: string | null = null;

      if (npsn) {
        const { data: existingSekolah } = await supabase
          .from('sekolah')
          .select('id')
          .eq('npsn', npsn)
          .maybeSingle();
        if (existingSekolah) sekolahId = existingSekolah.id;
      }

      if (!sekolahId) {
        const { data: newSekolah, error: sekolahError } = await supabase
          .from('sekolah')
          .insert({
            npsn: npsn || null,
            nama: namaSekolah,
            jenjang,
            akreditasi,
          })
          .select('id')
          .single();

        if (sekolahError) throw sekolahError;
        sekolahId = newSekolah.id;
      }

      const { data: existingSiswa } = await supabase
        .from('siswa')
        .select('id')
        .eq('nama', nama)
        .maybeSingle();

      let siswaId: string;

      if (existingSiswa) {
        const { error: updateError } = await supabase
          .from('siswa')
          .update({
            kelas,
            sekolah_id: sekolahId,
            peringkat_kelas_paralel: peringkatKelas
              ? Number(peringkatKelas)
              : null,
            jumlah_siswa_eligible: jumlahEligible
              ? Number(jumlahEligible)
              : null,
            updated_at: new Date().toISOString(),
          })
          .eq('id', existingSiswa.id);

        if (updateError) throw updateError;
        siswaId = existingSiswa.id;
      } else {
        const { data: newSiswa, error: siswaError } = await supabase
          .from('siswa')
          .insert({
            nama,
            kelas,
            sekolah_id: sekolahId,
            peringkat_kelas_paralel: peringkatKelas
              ? Number(peringkatKelas)
              : null,
            jumlah_siswa_eligible: jumlahEligible
              ? Number(jumlahEligible)
              : null,
          })
          .select('id')
          .single();

        if (siswaError) throw siswaError;
        siswaId = newSiswa.id;
      }

      await supabase
        .from('pilihan_siswa')
        .delete()
        .eq('siswa_id', siswaId)
        .eq('jalur', 'SNBP');

      const { error: pilihanError } = await supabase
        .from('pilihan_siswa')
        .insert({
          siswa_id: siswaId,
          prodi_id: prodi.id,
          jalur: 'SNBP',
          urutan: 1,
        });

      if (pilihanError) throw pilihanError;

      localStorage.setItem(
        'mantra_siswa',
        JSON.stringify({
          id: siswaId,
          nama,
          kelas,
          sekolah_id: sekolahId,
          akreditasi,
          peringkatKelas: peringkatKelas ? Number(peringkatKelas) : null,
          jumlahEligible: jumlahEligible ? Number(jumlahEligible) : null,
          target_prodi: `${prodi.prodi} (${prodi.singkatan})`,
          prodi_id: prodi.id,
        })
      );

      setMessage(`✅ Data ${nama} tersimpan! Lanjut isi Rapor.`);
      setTimeout(() => router.push('/rapor'), 1500);
    } catch (err: any) {
      setMessage('❌ Error: ' + err.message);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="space-y-4">
      <div className="bg-card border border-border rounded-2xl p-6">
        <h2 className="text-xl font-bold mb-1">📝 Data Siswa</h2>
        <p className="text-muted-foreground text-xs mb-5">
          Informasi dasar tentang kamu.
        </p>

        <div className="space-y-4">
          <div>
            <Label className="mb-2 block text-sm">👤 Nama Lengkap</Label>
            <Input
              value={nama}
              onChange={(e) => setNama(e.target.value)}
              placeholder="Cth: Ahmad Iqbal Alif"
              className="bg-secondary border-border"
            />
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div>
              <Label className="mb-2 block text-sm">📚 Kelas</Label>
              <Select value={kelas} onValueChange={(v) => setKelas(v ?? '')}>
                <SelectTrigger className="bg-secondary border-border">
                  <SelectValue placeholder="-- Pilih --" />
                </SelectTrigger>
                <SelectContent>
                  {daftarKelas.map((k) => (
                    <SelectItem key={k} value={k}>
                      {k}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label className="mb-2 block text-sm">🏆 Peringkat Kelas</Label>
              <Input
                type="number"
                value={peringkatKelas}
                onChange={(e) => setPeringkatKelas(e.target.value)}
                placeholder="Cth: 5"
                className="bg-secondary border-border"
              />
            </div>
          </div>

          <div>
            <Label className="mb-2 block text-sm">
              👥 Jumlah Siswa Eligible (seangkatan)
            </Label>
            <Input
              type="number"
              value={jumlahEligible}
              onChange={(e) => setJumlahEligible(e.target.value)}
              placeholder="Cth: 30"
              className="bg-secondary border-border"
            />
          </div>
        </div>
      </div>

      <div className="bg-card border border-border rounded-2xl p-6">
        <h2 className="text-xl font-bold mb-1">🏫 Data Sekolah</h2>
        <p className="text-muted-foreground text-xs mb-5">
          Akreditasi sekolah mempengaruhi indeks rekam jejak di PTN.
        </p>

        <div className="space-y-4">
          <div>
            <Label className="mb-2 block text-sm">🏫 Nama Sekolah</Label>
            <Input
              value={namaSekolah}
              onChange={(e) => setNamaSekolah(e.target.value)}
              placeholder="Cth: SMAN 1 Jakarta"
              className="bg-secondary border-border"
            />
          </div>

          <div>
            <Label className="mb-2 block text-sm">🔢 NPSN (opsional)</Label>
            <Input
              value={npsn}
              onChange={(e) => setNpsn(e.target.value)}
              placeholder="8 digit NPSN"
              className="bg-secondary border-border"
            />
          </div>

          <div className="grid grid-cols-2 gap-3">
            <div>
              <Label className="mb-2 block text-sm">🎓 Jenjang</Label>
              <Select
                value={jenjang}
                onValueChange={(v) => setJenjang(v ?? 'SMA')}
              >
                <SelectTrigger className="bg-secondary border-border">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="SMA">SMA</SelectItem>
                  <SelectItem value="SMK">SMK</SelectItem>
                  <SelectItem value="MA">MA</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label className="mb-2 block text-sm">⭐ Akreditasi</Label>
              <Select
                value={akreditasi}
                onValueChange={(v) => setAkreditasi(v ?? 'A')}
              >
                <SelectTrigger className="bg-secondary border-border">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="A">A</SelectItem>
                  <SelectItem value="B">B</SelectItem>
                  <SelectItem value="C">C</SelectItem>
                  <SelectItem value="Belum">Belum Terakreditasi</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
        </div>
      </div>

      <div className="bg-card border border-border rounded-2xl p-6">
        <h2 className="text-xl font-bold mb-1">🎯 Target Prodi</h2>
        <p className="text-muted-foreground text-xs mb-5">
          Pilih prodi impianmu. Bisa ditambah nanti untuk SNBP pilihan 2.
        </p>

        <ProdiSearch value={prodi} onChange={setProdi} />
      </div>

      <div className="space-y-3">
        <Button
          onClick={handleSubmit}
          disabled={loading}
          className="w-full bg-primary hover:bg-primary/90 text-primary-foreground font-semibold py-6"
        >
          {loading ? 'Menyimpan...' : '💾 Simpan & Lanjut ke Rapor →'}
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