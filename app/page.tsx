'use client';

import { useState } from 'react';
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
  const [nama, setNama] = useState('');
  const [kelas, setKelas] = useState('');
  const [prodi, setProdi] = useState<Prodi | null>(null);
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState('');

  const daftarKelas = Array.from({ length: 10 }, (_, i) => `XII-${i + 1}`);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();

    if (!nama || !kelas || !prodi) {
      setMessage('⚠️ Lengkapi Nama, Kelas, dan Target Prodi dulu!');
      return;
    }

    setLoading(true);
    setMessage('');

    const { data: existing } = await supabase
      .from('siswa')
      .select('id')
      .eq('nama', nama)
      .maybeSingle();

    let error;
    if (existing) {
      const { error: updateError } = await supabase
        .from('siswa')
        .update({
          kelas,
          target_prodi: `${prodi.prodi} (${prodi.universitas})`,
        })
        .eq('id', existing.id);
      error = updateError;
    } else {
      const { error: insertError } = await supabase.from('siswa').insert({
        nama,
        kelas,
        target_prodi: `${prodi.prodi} (${prodi.universitas})`,
      });
      error = insertError;
    }

    setLoading(false);

    if (error) {
      setMessage('❌ Error: ' + error.message);
    } else {
      const { data: currentSiswa } = await supabase
        .from('siswa')
        .select('id, nama, kelas, target_prodi')
        .eq('nama', nama)
        .maybeSingle();

      if (currentSiswa) {
        localStorage.setItem('mantra_siswa', JSON.stringify(currentSiswa));
      }

      setMessage(
        `✅ Data ${nama} tersimpan! Klik tab SNBP di atas untuk lanjut.`
      );
    }
  }

  return (
    <div className="space-y-4">
      <div className="bg-card border border-border rounded-2xl p-6">
        <h2 className="text-2xl font-bold mb-1">Data Diri</h2>
        <p className="text-muted-foreground text-sm mb-6">
          Isi data dulu sebelum lanjut ke prediksi SNBP/SNBT.
        </p>

        <form onSubmit={handleSubmit} className="space-y-5">
          <div>
            <Label htmlFor="nama" className="mb-2 block text-sm">
              👤 Nama Lengkap
            </Label>
            <Input
              id="nama"
              value={nama}
              onChange={(e) => setNama(e.target.value)}
              placeholder="Cth: Ahmad Iqbal"
              className="bg-secondary border-border"
            />
          </div>

          <div>
            <Label htmlFor="kelas" className="mb-2 block text-sm">
              📚 Kelas
            </Label>
            <Select value={kelas} onValueChange={setKelas}>
              <SelectTrigger className="bg-secondary border-border">
                <SelectValue placeholder="-- Pilih Kelas --" />
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
            <Label className="mb-2 block text-sm">
              🎯 Target Prodi & Universitas
            </Label>
            <ProdiSearch value={prodi} onChange={setProdi} />
          </div>

          <Button
            type="submit"
            disabled={loading}
            className="w-full bg-primary hover:bg-primary/90 text-primary-foreground font-semibold py-6"
          >
            {loading ? 'Menyimpan...' : '💾 Simpan & Lanjut ke SNBP →'}
          </Button>
        </form>

        {message && (
          <div className="mt-4 p-3 rounded-xl bg-primary/10 border border-primary/30 text-sm">
            {message}
          </div>
        )}
      </div>
    </div>
  );
}