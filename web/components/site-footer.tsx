import { siteConfig } from '@/site.config';

import Link from 'next/link';

import ThemeToggle from '@/components/theme-toggle';

export default function SiteFooter() {
  return (
    <footer className="top-0 z-50 flex w-full flex-col items-center justify-between border-t bg-background/95 p-3 lg:flex-row lg:gap-4 lg:p-5">
      <div className="flex w-full items-center justify-between pb-3 lg:px-4 lg:pb-0">
        <h2>
          Built with &#10084; at{' '}
          <Link
            href={siteConfig.github}
            className="text-sm font-medium transition-colors hover:text-foreground/80"
          >
            {siteConfig.organization}
          </Link>
        </h2>
        <ThemeToggle />
      </div>
    </footer>
  );
}
