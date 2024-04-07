import { LockIcon, FileDown, ListChecks } from 'lucide-react';

import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';

const featuresdata = [
  {
    heading: 'Secure data storage',
    subheading: 'Purely encrypted data stored on the cloud',
    icon: <LockIcon className="h-8 w-8" />
  },
  {
    heading: 'Data Ownership',
    subheading: 'You own your data, and choose who to share it with',
    icon: <FileDown className="h-8 w-8" />
  },
  {
    heading: 'Insurance Compatibility',
    subheading: 'Verify if a hospital is covered under your insurance',
    icon: <ListChecks className="h-8 w-8" />
  }
];

const testimonialsdata = [
  {
    imgSrc : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvbnxFBLPOAidyJB7eqQavnJXslUnfryaJGA&s',
    name: 'Ram Mohan',
    location: 'Nashik, Maharashtra',
    quote: 'A real life saver, I no longer need to worry about carrying every single document with me. I can access my medical records from anywhere in the world.'
  },
  {
    imgSrc: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGhiH11IKnHuWq9XlkHTYaY1f9_mHAn5rpKA&s',
    name: 'Sneha Sharma',
    location: 'Bangalore, Karnataka',
    quote: 'I can now easily verify if a hospital is covered under my insurance. This has saved me a lot of time and effort.'
  },
  {
    imgSrc: 'data:image/jpeg;base64,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',
    name: 'Rajesh Kumar',
    location: 'Mumbai, Maharashtra',
    quote: 'I can now easily rate hospitals and share my experiences with others. This has helped me make better decisions.'
  }
]

export default function HomePage() {
  return (
    <div className="flex flex-col"
    style={{
      backgroundImage: 'url(/home_image.jpg)',
      backgroundPosition: "center",
      backgroundSize: "cover",
      backgroundRepeat: "no-repeat",
    }}
    >
      <div className="flex w-full flex-col items-center justify-center gap-4 pb-24 text-center min-h-[calc(100vh_-_theme(spacing.16))]">
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

      <div className="mx-auto my-0 flex w-full max-w-7xl overflow-hidden px-6">
        <div className="grid gap-x-4 gap-y-4 lg:grid-cols-2">
          {/* Column-1 */}
          <div>
            <h3 className="feature-font text-enter mb-4 text-xl font-semibold text-gray-600 md:text-start">
              FEATURES
            </h3>
            <h2 className="text-offwhite text-enter mb-6 text-3xl font-semibold leading-snug md:text-start lg:text-4xl">
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
            <div className="grid gap-x-4 gap-y-4 md:grid-cols-2 md:my-20 lg:grid-cols-3">
              {featuresdata.map((items, i) => (
                <Card className="rounded-lg bg-gray-50 py-12" key={i}>
                  <CardContent>
                    <div className="mb-4 flex items-center justify-start rounded-full">
                      {items.icon}
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

      <div className='flex flex-col gap-10 lg:gap-16 pt-8 pb-20 mx-0'>
            <div className='flex flex-col gap-4 items-center lg:flex-row lg:justify-around lg:items-center'>
              <img src="https://www.shutterstock.com/image-vector/one-line-drawing-laptop-computer-600nw-2049860036.jpg" alt="data-owner" className="w-100 h-72 object-cover hidden lg:block rounded-lg"/>
              <img src="https://www.shutterstock.com/image-vector/one-line-drawing-laptop-computer-600nw-2049860036.jpg" alt="data-owner" className="w-72 h-40 object-cover block lg:hidden rounded-lg"/>
              <div className='feature-font text-enter mb-4 text-xl lg:text-4xl font-semibold text-gray-600'>Choose who can access what.<br/>
                <span className='font-normal text-xs lg:text-lg'>Have complete control over who can access your data, <br/> and when they can access it, at the convenience of a click.<br/>
                  Your data will truly remain your own.
                </span>
              </div>
            </div>
            <div className='flex flex-col items-center gap-4 lg:flex-row-reverse lg:justify-around lg:items-center'>
              <img src="https://www.shutterstock.com/image-vector/hand-drawing-five-stars-rating-260nw-2268357417.jpg" alt="data-owner" className="w-100 h-72 object-cover hidden lg:block rounded-lg"/>
              <img src="https://www.shutterstock.com/image-vector/hand-drawing-five-stars-rating-260nw-2268357417.jpg" alt="data-owner" className="w-72 h-40 object-cover block lg:hidden rounded-lg"/>
              <div className='feature-font text-enter mb-4 text-xl lg:text-4xl font-semibold text-gray-600'>Hospitals picked out for you. <br/>
                <span className='font-normal text-xs lg:text-lg'>See all highest rated hospitals near you <br/>all compatible with your insurance provider.<br/>
                  You will never need to worry about the quality of care you receive.
                </span>
              </div>
            </div>
      </div>

      <div className='mx-auto my-0 flex w-full max-w-7xl overflow-hidden px-6 flex-col pt-4'>
          <h3 className="feature-font text-enter mb-4 text-xl font-semibold text-gray-600 md:text-start">
              TESTIMONIALS
          </h3>
          <h2 className="text-offwhite text-enter mb-6 text-3xl font-semibold leading-snug md:text-start lg:text-4xl">
              See what our customers <br/> are saying
          </h2>
          <div className='grid gap-x-4 gap-y-1 md:grid-cols-2 lg:grid-cols-3'>
              {
                  testimonialsdata.map((items, i) => (
                      <div className='flex flex-col lg:grid lg:grid-rows-2' key={i}>
                          <Card className="rounded-lg bg-gray-50 py-5" key={i}>
                              <CardContent>
                                  <div className="flex items-center mb-4 justify-start rounded-full">
                                      <img src={items.imgSrc} alt={items.name} className='h-8 w-8 rounded-full'/>
                                  </div>
                                  <div className='flex flex-col gap-0'>
                                    <h5 className="text-offwhite text-md font-medium">
                                        {items.name}
                                    </h5>
                                    <p className="text-lightblue mb-4 text-sm font-normal">
                                        {items.location}
                                    </p>
                                  </div>
                                  <p className="text-lightblue text-sm font-normal">
                                      {items.quote}
                                  </p>
                              </CardContent>
                          </Card>
                      </div>
                  ))
              }
          </div>
      </div>
    </div>
  );
}
