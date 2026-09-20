export function hitungSkorSNBP(
  rataRapor: number,
  nilaiTKA1: number,
  nilaiTKA2: number
): number {
  const rataTKA = (nilaiTKA1 + nilaiTKA2) / 2;
  const skor = rataRapor * 0.5 + rataTKA * 0.5;
  return Math.round(skor * 100) / 100;
}

export function hitungSkorUTBK(nilaiSubtes: number[]): number {
  const bobot = [30, 20, 20, 20, 20, 20, 20];
  const totalSoal = 150;
  let skor = 0;
  for (let i = 0; i < nilaiSubtes.length; i++) {
    skor += nilaiSubtes[i] * bobot[i];
  }
  return Math.round((skor / totalSoal) * 10);
}

export function getRekomendasiNilai(pg: number) {
  return {
    min: Math.round(pg * 0.85),
    avg: Math.round(pg),
    max: Math.round(pg * 1.15),
  };
}