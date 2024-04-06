import io
import os
import aiofiles
from sanic import Request, json, file
from sanic.views import HTTPMethodView
from sanic_ext import validate

from api.utils import generate_uuid

from dotenv import dotenv_values

import asyncio

from aiob2 import Client

from pydantic import BaseModel

from motor.motor_asyncio import AsyncIOMotorCollection


class FileDownload(BaseModel):
    file_name: str


class FileUpload(BaseModel):
    data: bytes
    aadhaar_number: str
    file_name: str


class FileAction(HTTPMethodView):

    "Class to handle file operations"

    config = dotenv_values(".env")

    key_id = config.get("AWS_ACCESS_KEY_ID")
    secret_key = config.get("AWS_SECRET_ACCESS_KEY")
    bucket_id = config.get("Bucket_ID")
    bucket_name = config.get("Bucket_Name")

    @validate(json=FileDownload)
    async def get(self, request: Request, body: FileDownload):
        async with Client(self.key_id, self.secret_key) as client:
            file_s3 = await client.download_file_by_name(
                file_name=body.file_name,
                bucket_name=self.bucket_name,
            )

            # Check if the file exists
            if file_s3 is None:
                return json({"message": "File not found."},status=404)

            # Save the file in the temp directory using aiofiles
            path = os.path.join(os.getcwd(), "temp")
            temp_path = os.path.join(path, body.file_name)
            async with aiofiles.open(temp_path, "wb") as f:
                await f.write(file_s3.content)

            await request.respond(
                await file(
                    temp_path, filename=body.file_name, mime_type=file_s3.content_type
                )
            )

            # Delete the file from the temp directory
            os.remove(temp_path)

    @validate(json=FileUpload)
    async def post(self, request: Request, body: FileUpload):

        patients: AsyncIOMotorCollection = request.app.ctx.db["patients"]

        # verify if the patient exists
        patient = await patients.find_one({"aadhaar_number": body.aadhaar_number})

        if patient is None:
            return json({"message": "Patient not found."}, status=404)

        # add file name and id to file record
        file_id = await generate_uuid()
        file_name = body.file_name

        # save the file in the database using $push into files dictionary in history dictionary in patient
        await patients.update_one(
            {"aadhaar_number": body.aadhaar_number},
            {"$push": {"history.files": {"id": file_id, "name": file_name}}},
        )
        
        # save the file in the s3 bucket
        async with Client(self.key_id, self.secret_key) as client:
            file_s3 = await client.upload_file(
                content_bytes=body.data,
                file_name="test.jpg",
                bucket_id=self.bucket_id,
            )
        
        return json({"message": "File uploaded successfully."}, status=200)


