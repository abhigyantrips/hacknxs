import { MainNav } from '@/components/main-nav';

import { CircleUserIcon } from 'lucide-react';
import { Button } from '@/components/ui/button';
import Link from 'next/link';

export default function SiteHeader() {
  return (
    <header className="sticky top-0 z-50 w-full border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
      <div className="container flex h-16 items-center space-x-4 sm:justify-between sm:space-x-0">
        <MainNav />
        <div className="flex flex-1 items-center justify-end space-x-4">
        <Button
            variant="secondary"
            size="icon"
            className="rounded-full"
            asChild
          >
            <Link href="/profile">
              <CircleUserIcon className="h-5 w-5" />
              <span className="sr-only">Toggle user menu</span>
            </Link>
          </Button>
        </div>
      </div>
    </header>
  );
}
