export default function Home() {
  return (
    <div className="space-y-4">
      <div className="bg-card border border-border rounded-2xl p-6">
        <h2 className="text-2xl font-bold mb-2">Selamat Datang di MANTRA 👋</h2>
        <p className="text-muted-foreground text-sm leading-relaxed">
          Asisten pintar untuk memprediksi peluang masuk PTN impianmu,
          sekaligus menjaga kesehatan mentalmu.
        </p>
      </div>

      <div className="bg-primary/10 border border-primary/30 rounded-2xl p-4">
        <p className="text-sm text-primary">
          ⚡ UI setup berhasil! Selanjutnya kita isi halaman ini dengan form Data Diri.
        </p>
      </div>
    </div>
  );
}