'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';

const tabs = [
  { name: 'Data Diri', href: '/', icon: '📝' },
  { name: 'Rapor', href: '/rapor', icon: '📊' },
  { name: 'Prestasi', href: '/prestasi', icon: '🏆' },
  { name: 'SNBP', href: '/snbp', icon: '🎓' },
];

export function Navbar() {
  const pathname = usePathname();

  return (
    <header className="sticky top-0 z-50 w-full bg-black/80 backdrop-blur-md border-b border-border">
      <div className="max-w-2xl mx-auto px-4 py-3">
        <Link href="/" className="block mb-3">
          <h1 className="text-xl font-extrabold tracking-tight">MANTRA</h1>
          <p className="text-[10px] text-muted-foreground">
            Prediksi PTN & Kesehatan Mental
          </p>
        </Link>

        <nav className="flex gap-1 bg-card border border-border rounded-xl p-1 overflow-x-auto">
          {tabs.map((tab) => {
            const isActive = pathname === tab.href;
            return (
              <Link
                key={tab.href}
                href={tab.href}
                className={`flex-1 min-w-[70px] text-center py-2 px-1 rounded-lg text-[10px] font-semibold transition-all whitespace-nowrap ${
                  isActive
                    ? 'bg-primary/20 text-foreground'
                    : 'text-muted-foreground hover:text-foreground hover:bg-secondary'
                }`}
              >
                <span className="mr-1">{tab.icon}</span>
                {tab.name}
              </Link>
            );
          })}
        </nav>
      </div>
    </header>
  );
}