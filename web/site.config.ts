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
  tags : [
    { id: 0, name: 'all specialities' },
    { id: 1, name: 'Orthopaedics' },
    { id: 2, name: 'Nephrology' },
    { id: 3, name: 'Urology' },
    { id: 4, name: 'Oncology' },
    { id: 5, name: 'Neurology' },
    { id: 6, name: 'General Surgery' },
    { id: 7, name: 'Paediatrics' },
    { id: 8, name: 'Cardiology' },
    { id: 9, name: 'Haemotology' },
    { id: 10, name: 'Pulmonology' },
    { id: 11, name: 'Gastroenterology' },
    { id: 12, name: 'Dentistry' },
    { id: 13, name: 'Gynaecology' },
    { id: 14, name: 'ENT' },
    { id: 15, name: 'Physiotherapy' },
    { id: 16, name: 'Nutrition' },
    { id: 17, name: 'Fitness' }
]
}
