import { supabase } from '@/lib/supabase';

export default async function Home() {
  const { data, error, count } = await supabase
    .from('passing_grade')
    .select('*', { count: 'exact' })
    .limit(10);

  if (error) {
    return (
      <div className="p-8">
        <h1 className="text-red-500 text-2xl font-bold">❌ Error</h1>
        <p className="mt-2">{error.message}</p>
      </div>
    );
  }

  return (
    <div className="p-8 min-h-screen bg-black text-white">
      <h1 className="text-3xl font-bold mb-2">✅ Koneksi Supabase Berhasil!</h1>
      <p className="text-zinc-400 mb-6">
        Total data di tabel passing_grade:{' '}
        <strong className="text-pink-500">{count} baris</strong>
      </p>

      <h2 className="text-xl font-semibold mb-3">Contoh 10 data pertama:</h2>
      <div className="space-y-2">
        {data?.map((item) => (
          <div key={item.id} className="border border-zinc-800 p-3 rounded-lg">
            <div className="font-semibold text-pink-400">{item.prodi}</div>
            <div className="text-sm text-zinc-400">{item.universitas}</div>
            <div className="text-xs text-zinc-500 mt-1">
              PG SNBT: {item.pg_snbt}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}