import { LockIcon } from 'lucide-react';

import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';

const featuresdata = [
  {
    imgSrc: '/images/Features/featureOne.svg',
    heading: 'Secure storage',
    subheading: 'Purely encrypted data stored on the cloud',
  },
  {
    imgSrc: '/images/Features/featureTwo.svg',
    heading: 'Free to use',
    subheading: 'Top notch crypto portfolio traking at no cost',
  },
  {
    imgSrc: '/images/Features/featureThree.svg',
    heading: 'Real-time price data',
    subheading: 'Updating 24/7 using price data form the biggest exchanges',
  },
];

export default function HomePage() {
  return (
    <div className="mt-3 flex flex-col">
      <div className="mx-auto flex w-full flex-col items-center justify-center gap-4 pb-24 pt-40 text-center">
        <h1 className="text-5xl font-bold">
          Seamless Healthcare Access, Tailored to You.
        </h1>
        <p className="text-xl">
          Empower your health journey. Take control, rate hospitals, and verify
          insurance with ease.
        </p>
        <div className="flex flex-row gap-4 py-4">
          <Button>Get Access</Button>
          <Button variant="secondary">Learn More</Button>
        </div>
      </div>
      <div className="mx-auto my-0 flex w-full max-w-7xl overflow-hidden px-6 md:my-40">
        <div className="grid gap-x-4 gap-y-4 lg:grid-cols-2">
          {/* Column-1 */}
          <div>
            <h3 className="feature-font text-enter mb-4 text-lg font-semibold text-gray-600 md:text-start">
              FEATURES
            </h3>
            <h2 className="text-offwhite text-enter mb-6 text-3xl font-semibold leading-snug md:text-start lg:text-5xl">
              The most trusted healthcare data platform
            </h2>
            <p className="text-bluish text-enter font-normal md:text-start lg:text-lg">
              Lorem Ipsum is simply dummy text of the printing and typesetting
              industry. Lorem Ipsum has been the industry standard dummy text
              ever since the 1500s.
            </p>
          </div>
          {/* Column-2 */}
          <div>
            <div className="grid gap-x-4 gap-y-4 md:grid-cols-2 lg:-mr-36 lg:grid-cols-3">
              {featuresdata.map((items, i) => (
                <Card className="rounded-lg bg-gray-50 py-12" key={i}>
                  <CardContent>
                    <div className="mb-4 flex items-center justify-start rounded-full">
                      <LockIcon className="h-8 w-8" />
                    </div>
                    <h5 className="text-offwhite mb-4 text-lg font-medium">
                      {items.heading}
                    </h5>
                    <p className="text-lightblue text-sm font-normal">
                      {items.subheading}
                    </p>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
