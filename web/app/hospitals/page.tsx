import {
    Card,
    CardContent,
    CardFooter,
    CardHeader,
    CardTitle,
} from '@/components/ui/card'

import { StarIcon, StarHalfIcon } from 'lucide-react'

export default function HospitalsPage() {

    const hospitals = [
        {
            id: 1,
            name: "Manipal Hospital",
            specialities: ["Cardiology", "Neurology"],
            address: "Sarjapur Road, Bangalore",
            rating : 4.5
        },
        {
            id: 2,
            name: "Apollo Hospital",
            specialities: ["Oncology", "Haeamatology"],
            address:"M.G. Road, Chennai",
            rating : 3.8
        },
        {
            id: 3,
            name: "Fortis Hospital",
            specialities: ["Orthopaedics", "General Surgery"],
            address: "Dadar, Mumbai",
            rating: 4.2
        },
        {
            id: 4,
            name: "Columbia Asia Hospital",
            specialities: ["Cardiology", "Neurology"],
            address: "Dwarka, Delhi",
            rating: 3.4
        },
        {
            id: 5,
            name: "Apollo Hospital",
            specialities: ["Oncology", "Haeamatology"],
            address: "Adyar,Chennai",
            rating: 4.3
        },
    ]

    return (
        <div className='mx-10'>
            <div className="flex flex-col lg:flex-row gap-4 lg:gap-10 space-y-0.5 border-b py-6">
                <div>
                    <h2 className="text-2xl tracking-tight font-bold">
                        Hospitals for You
                    </h2>
                    <p className="text-muted-foreground">
                        View all hospitals you have insurance compatibility with.
                    </p>
                </div>
            </div>

            <div className='pt-6'>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">

                    {hospitals.sort((a,b) => b.rating - a.rating)
                    .map((hospital) => (

                        <Card key={hospital.id} className='group hover:border-green-500 hover:duration-1000'>
                            <CardHeader>
                                <CardTitle className='group-hover:text-green-500 group-hover:duration-1000'>{hospital.name}</CardTitle>
                                <div>{hospital.address}</div>
                            </CardHeader>
                            <CardContent>
                                {
                                    <div className='flex px-1'>
                                    {
                                        Array.from({ length: Math.floor(hospital.rating) }, (_, i) => (
                                            <StarIcon key={i} className={'text-yellow-600 dark:text-yellow-500 w-5 h-5'} />
                                        ))
                                    }
                                    {
                                        Array.from({ length: (hospital.rating - Math.floor(hospital.rating) )/0.5 }, (_, i) => (
                                            <StarHalfIcon key={i} className={'text-yellow-600 dark:text-yellow-500 w-5 h-5'} />
                                        ))
                                    }
                                </div>
                                }
                            </CardContent>
                        </Card>
                    ))}

                </div>
                    
            </div>
        </div>
    )
}