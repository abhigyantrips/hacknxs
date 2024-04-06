import {
    Card,
    CardContent,
    CardFooter,
    CardHeader,
    CardTitle,
} from '@/components/ui/card'

export default function ConsultationPage(){

    const consultations = [
        {
            id: 1,
            date: "10th July 2021",
            hospital: "Manipal Hospital",
            speciality: "Cardiology",
            doctor: "Dr.Ram Mohan",
        },
        {
            id: 2,
            date: "15th August 2021",
            hospital: "Apollo Hospital",
            speciality: "Oncology",
            doctor: "Dr.Jannat",
        },
        {
            id: 3,
            date: "5th September 2021",
            hospital: "Fortis Hospital",
            speciality: "Orthopaedics",
            doctor: "Dr.Sneha Sharma",
        },
        {
            id: 4,
            date: "10th October 2021",
            hospital: "Columbia Asia Hospital",
            speciality: "Neurology",
            doctor: "Dr.Ravi Kumar",
        },
        {
            id: 5,
            date: "15th November 2021",
            hospital: "Apollo Hospital",
            speciality: "Oncology",
            doctor: "Dr.Jannat",
        },   
    ]

    return (
        <>

            <div className="flex flex-col lg:flex-row gap-4 lg:gap-10 space-y-0.5 border-b pb-6 pt-6">
                <div>
                    <h2 className="text-2xl tracking-tight font-bold">
                        Your Past Consultations
                    </h2>
                    <p className="text-muted-foreground">
                        View all the consultations that you have attended.
                    </p>
                </div>
            </div>

            <div className="flex flex-col lg:grid lg:grid-rows-2 lg:grid-cols-2 gap-4 pt-6">
                {
                    consultations.map((consultation:any) => (
                        <Card key={consultation.id} className='p-5'>
                            <div className='flex justify-between'>
                            <CardHeader className='flex flex-col justify-between'>
                                <CardTitle className='flex justify-between'>
                                    <div className='text-left'>
                                        {consultation.speciality}
                                        <p className="text-muted-foreground text-sm">
                                        {consultation.date}
                                        </p>
                                    </div>
                                </CardTitle>
                                <p className='text-left pb-2'>
                                    This consultation was held for the speciality of {consultation.speciality}.
                                </p>
                            </CardHeader>
                            <CardContent className='flex flex-col justify-end text-right'>
                                <div className="flex items-center mb-4 justify-end rounded-full">
                                    <img src="/doc_icon.png" alt="Doc Icon" className='h-16 w-16 rounded-full'/>
                                </div>
                                <p className="text-muted-foreground">
                                    {consultation.doctor}
                                </p>
                                <p className="text-muted-foreground">
                                    {consultation.hospital}
                                </p>
                            </CardContent>
                            </div>
                        </Card>
                    ))
                }
            </div>

        </>   
    )
}