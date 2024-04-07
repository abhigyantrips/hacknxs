/** @type {import('next').NextConfig} */
const nextConfig = {
  optimizeFonts: true,
  async redirects() {
    return [
      {
        source: '/portfolio',
        destination: 'https://abhigyantrips.notion.site/5a4695dcbded4f7d85aa9e9b7a3ab874',
        permanent: false,
      },
    ];
  },
};

export default nextConfig;
