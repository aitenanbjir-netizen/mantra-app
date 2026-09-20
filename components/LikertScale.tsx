'use client';

const options = [
  { val: 1, emoji: '😄', label: 'Sangat Baik' },
  { val: 2, emoji: '🙂', label: 'Baik' },
  { val: 3, emoji: '😐', label: 'Netral' },
  { val: 4, emoji: '😟', label: 'Cemas' },
  { val: 5, emoji: '😰', label: 'Sangat Stres' },
];

type Props = {
  value: number;
  onChange: (val: number) => void;
};

export function LikertScale({ value, onChange }: Props) {
  return (
    <div className="flex gap-2">
      {options.map((opt) => {
        const active = value === opt.val;
        return (
          <button
            key={opt.val}
            type="button"
            onClick={() => onChange(opt.val)}
            className={`flex-1 flex flex-col items-center gap-1 py-3 px-1 rounded-xl border transition-all ${
              active
                ? 'bg-primary/20 border-primary text-foreground'
                : 'bg-secondary border-border text-muted-foreground hover:border-primary/50'
            }`}
          >
            <span className="text-2xl">{opt.emoji}</span>
            <span className="text-[10px] font-semibold text-center leading-tight">
              {opt.label}
            </span>
          </button>
        );
      })}
    </div>
  );
}