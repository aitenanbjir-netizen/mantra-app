'use client';

import { useState, useEffect } from 'react';
import { Search } from 'lucide-react';
import { Input } from '@/components/ui/input';
import { supabase } from '@/lib/supabase';

export type Prodi = {
  id: string;
  prodi: string;
  universitas: string;
  singkatan: string;
  rumpun: string;
  mapel_pendukung: string[];
  daya_tampung_snbp: number;
  daya_tampung_snbt: number;
  peminat_snbp_historis: number[];
  peminat_snbt_historis: number[];
};

type Props = {
  value: Prodi | null;
  onChange: (prodi: Prodi) => void;
};

export function ProdiSearch({ value, onChange }: Props) {
  const [search, setSearch] = useState('');
  const [prodiList, setProdiList] = useState<Prodi[]>([]);
  const [filtered, setFiltered] = useState<Prodi[]>([]);
  const [showDropdown, setShowDropdown] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchProdi() {
      const { data, error } = await supabase
        .from('prodi_lengkap')
        .select('*')
        .order('universitas', { ascending: true })
        .limit(500);
      if (!error && data) setProdiList(data as Prodi[]);
      setLoading(false);
    }
    fetchProdi();
  }, []);

  useEffect(() => {
    if (search.trim().length < 2) {
      setFiltered([]);
      return;
    }
    const q = search.toLowerCase();
    const results = prodiList
      .filter(
        (p) =>
          p.prodi.toLowerCase().includes(q) ||
          p.universitas.toLowerCase().includes(q)
      )
      .slice(0, 30);
    setFiltered(results);
  }, [search, prodiList]);

  function handleSelect(p: Prodi) {
    onChange(p);
    setSearch('');
    setShowDropdown(false);
  }

  return (
    <div className="relative">
      {value ? (
        <div className="flex items-center justify-between bg-secondary border border-border rounded-xl p-3">
          <div className="flex flex-col overflow-hidden">
            <span className="text-sm font-semibold truncate">{value.prodi}</span>
            <span className="text-xs text-muted-foreground truncate">
              {value.universitas} · SNBP: {value.daya_tampung_snbp} kursi
            </span>
          </div>
          <button
            type="button"
            onClick={() => onChange(null as any)}
            className="text-xs text-muted-foreground hover:text-foreground px-2"
          >
            Ganti
          </button>
        </div>
      ) : (
        <>
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                setShowDropdown(true);
              }}
              onFocus={() => setShowDropdown(true)}
              placeholder={
                loading ? 'Memuat data prodi...' : 'Ketik nama prodi / universitas...'
              }
              className="bg-secondary border-border pl-10"
            />
          </div>

          {showDropdown && filtered.length > 0 && (
            <div className="absolute z-50 w-full mt-2 max-h-72 overflow-y-auto bg-card border border-border rounded-xl shadow-2xl">
              {filtered.map((p) => (
                <button
                  key={p.id}
                  type="button"
                  onClick={() => handleSelect(p)}
                  className="w-full text-left px-4 py-3 hover:bg-secondary transition border-b border-border last:border-0"
                >
                  <div className="text-sm font-semibold">{p.prodi}</div>
                  <div className="text-xs text-muted-foreground">
                    {p.universitas} · {p.daya_tampung_snbp} kursi SNBP
                  </div>
                </button>
              ))}
            </div>
          )}

          {showDropdown && search.length >= 2 && filtered.length === 0 && !loading && (
            <div className="absolute z-50 w-full mt-2 bg-card border border-border rounded-xl p-4 text-sm text-muted-foreground">
              Prodi tidak ditemukan. Coba kata kunci lain.
            </div>
          )}
        </>
      )}
    </div>
  );
}