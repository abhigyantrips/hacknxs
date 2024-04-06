'use client';

import { siteConfig } from '@/site.config';

import React from 'react';

import Link from 'next/link';
import { usePathname } from 'next/navigation';

import { cn } from '@/lib/utils';

export function MainNav() {
  const navLinks = siteConfig.navLinks;
  const pathname = usePathname();

  return (
    <div className="flex gap-8">
      <Link href="/" className="inline-flex items-center font-bold text-xl">
        {siteConfig.name}
      </Link>
      <nav className="hidden items-center space-x-6 text-sm font-medium lg:flex">
        {navLinks?.map(
          (item, index) =>
            item.href && (
              <Link
                key={index}
                href={item.href}
                className={cn(
                  'transition-colors hover:text-foreground/80',
                  pathname === item.href
                    ? 'text-foreground'
                    : 'text-foreground/60'
                )}
              >
                {item.title}
              </Link>
            )
        )}
      </nav>
    </div>
  );
}
