import type { NavItem } from '@/types';

export type SiteConfig = typeof siteConfig;

export const siteConfig = {
  name: 'HealthSync',
  description: 'Facing compile-time errors since 2021.',
  organization: 'SKARR Pvt. Ltd.',
  github: 'https://github.com/abhigyantrips/hacknxs',
  navLinks: [
    {
      title: 'Documents',
      href: '/documents',
    },
    {
      title: 'Consultations',
      href: '/consultations',
    },
    {
      title: 'About Us',
      href: '/about',
    },
  ] satisfies NavItem[],
  institute: {
    name: 'Manipal Institute of Technology, Bengaluru',
    city: 'Bengaluru, Karnataka',
    href: 'https://manipal.edu/mitblr',
  },
};
