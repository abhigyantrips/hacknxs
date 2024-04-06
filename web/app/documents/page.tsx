"use client"

import { useState } from 'react'

import { siteConfig } from '@/site.config'

import { SearchIcon } from 'lucide-react'

import {
  Card,
  CardContent,
  CardFooter,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'

import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
  } from "@/components/ui/select"

import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

import toTitleCase from '@/lib/titleCase'


export default function DocumentsPage(){

  const [tag,setTag] = useState("all specialities")

  const [search,setSearch] = useState("")

  const tags = siteConfig.tags

  const docs = [
    {
        id: 1,
        name : "Document 1",
        date : "10th July 2021",
        hospital : "Manipal Hospital",
        tags: ["Cardiology", "Neurology"]
    },
    {
        id: 2,
        name: "Document 2",
        date: "15th August 2021",
        tags: ["Oncology", "Haeamatology"],
        hospital: "Apollo Hospital"
      },
      {
        id: 3,
        name: "Document 3",
        date: "5th September 2021",
        tags: ["Orthopaedics", "General Surgery"],
        hospital: "Fortis Hospital"
      },
      {
        id: 4,
        name: "Document 4",
        date: "20th October 2021",
        tags: ["Dentistry"],
        hospital: "Columbia Asia Hospital"
      },
      {
        id: 5,
        name: "Document 5",
        date: "12th November 2021",
        tags: ["Gynecology", "Pediatrics"],
        hospital: "Max Healthcare"
      },
      {
        id: 6,
        name: "Document 6",
        date: "25th December 2021",
        tags: ["ENT", "Physiotherapy"],
        hospital: "AIIMS"
      },
      {
        id: 7,
        name: "Document 7",
        date: "7th January 2022",
        tags: ["Nutrition", "Fitness"],
        hospital: "Narayana Health"
      },
      {
        id: 8,
        name: "Document 8",
        date: "14th February 2022",
        tags: ["Psychiatry", "Ophthalmology"],
        hospital: "Global Hospitals"
      },
      {
        id: 9,
        name: "Document 9",
        date: "3rd March 2022",
        tags: ["Urology", "Gastroenterology"],
        hospital: "Ruby Hall Clinic"
      }
  ]

  return (
    <div className="mt-8 mx-10 px-0 pb-c3 md:mt-c10 xl:mt-c5 xl:px-c8">
      
        <div>

            <div className="flex flex-col lg:flex-row gap-4 lg:gap-10 space-y-0.5 border-b pb-6">
                <div>
                <h2 className="text-2xl tracking-tight font-bold">
                    Your Documents
                </h2>
                <p className="text-muted-foreground">
                    View all the documents that you have uploaded.
                </p>
                </div>

                <div className="flex items-center gap-3 bg-background px-3 py-1 lg:py-2 border-0">
                    <SearchIcon className="w-6 h-6 text-gray-500 dark:text-gray-400" />
                    <Input 
                    placeholder="Search for books"
                    className="w-fit lg:w-72"
                    onChange={(e) => setSearch(e.target.value)}
                    />
                </div>

            </div>


        </div>

        <div className='pt-6'>
            <Select onValueChange={setTag} defaultValue="all specialities">
              <SelectTrigger className="w-[180px]">
                <SelectValue placeholder="Filter" />
              </SelectTrigger>
              <SelectContent>
                {tags.map((tag,index) => (
                  <SelectItem
                    key={index}
                    value={tag.name}
                  >
                    {toTitleCase(tag.name)}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

        <div className="flex flex-col gap-3 md:grid md:grid-cols-2 xl:grid-cols-3 pt-6">    

            {
            docs.filter((doc) => {
                if (tag === "all specialities") {
                return doc
                } else {
                return doc.tags?.includes(tag)
                }
            }
            ).filter((doc) => {
                if (search === "") {
                return doc
                } else if (doc.name.toLowerCase().includes(search.toLowerCase())) {
                return doc
                }
            }
            )   
            .map((doc) => (
                <div className="mt-c5" key={doc.id}>
                <Card className='bg-gray-50'>
                <CardHeader>
                    <CardTitle>{doc.name}</CardTitle>
                </CardHeader>
                <CardContent className='px-5'>
                    <div className="pb-2 pt-2">
                      {doc.tags?.map((tag: any) => (
                        <span
                          key={tag}
                          className="mb-2 mr-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700"
                        >
                          {tag}
                        </span>
                      ))}
                    </div>
                    <div className="text-sm text-foreground/60">{doc.date}</div>
                    <div className="text-sm text-foreground/60">{doc.hospital}</div>
                </CardContent>
                </Card>
                </div>
            ))}

        </div>
    </div>
  );
}