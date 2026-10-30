'use client';

import type { HasilPrediksi } from '@/lib/prediction';
import { CONFIDENCE_LABEL } from '@/lib/config';

type Props = {
  hasil: HasilPrediksi;
};

/**
 * Tampilan hasil prediksi bersama untuk SNBP & SNBT.
 * Dibuat satu komponen supaya kedua halaman benar-benar konsisten.
 */
export function HasilPrediksiView({ hasil }: Props) {
  return (
    <div className="space-y-4">
      <div className="bg-primary/10 border border-primary/30 rounded-2xl p-6 text-center">
        <p className="text-xs text-muted-foreground mb-1">
          PELUANG LOLOS {hasil.jalur} (TOTAL)
        </p>
        <p className="text-5xl font-extrabold text-primary mb-2">
          {Math.round(hasil.probabilitasTotal * 100)}%
        </p>
        <p className="text-xs text-muted-foreground">
          {hasil.pilihan.length} pilihan prodi · estimasi statistik, bukan
          jaminan
        </p>
      </div>

      {hasil.pilihan.map((p) => (
        <div
          key={p.urutan}
          className="bg-card border border-border rounded-2xl p-5 space-y-3"
        >
          <div className="flex justify-between items-start gap-3">
            <div className="flex-1 min-w-0">
              <p className="text-[10px] text-muted-foreground">
                PILIHAN {p.urutan}
              </p>
              <p className="font-bold text-sm truncate">{p.prodiNama}</p>
              <p className="text-xs text-muted-foreground truncate">
                {p.universitas}
              </p>
            </div>
            <div
              className="px-3 py-1 rounded-full text-[10px] font-bold shrink-0"
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
              <p className="text-[9px] text-muted-foreground">EST. CUTOFF</p>
              <p className="font-bold text-lg">{p.estimasiCutoff}</p>
            </div>
            <div className="bg-secondary rounded-xl p-2">
              <p className="text-[9px] text-muted-foreground">PELUANG</p>
              <p className="font-bold text-lg text-primary">
                {Math.round(p.probabilitas * 100)}%
              </p>
            </div>
          </div>

          <div className="flex items-center justify-between text-[10px] text-muted-foreground border-t border-border pt-2 gap-2">
            <span>
              Keyakinan data:{' '}
              <span className="text-foreground font-semibold">
                {CONFIDENCE_LABEL[p.confidenceData] ?? p.confidenceData}
              </span>
            </span>
            <span>
              Keketatan{' '}
              <span className="text-foreground font-semibold">
                1:{p.keketatan > 0 ? Math.round(1 / p.keketatan) : '—'}
              </span>
            </span>
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
              {p.faktorPendorong.map((f, i) => (
                <div key={i} className="flex justify-between text-xs py-0.5 gap-2">
                  <span className="text-muted-foreground">{f.faktor}</span>
                  <span className="text-emerald-300 font-bold shrink-0">
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
              {p.faktorPenghambat.map((f, i) => (
                <div key={i} className="flex justify-between text-xs py-0.5 gap-2">
                  <span className="text-muted-foreground">{f.faktor}</span>
                  <span className="text-red-300 font-bold shrink-0">
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
                {p.saran.map((s, i) => (
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
    </div>
  );
}
