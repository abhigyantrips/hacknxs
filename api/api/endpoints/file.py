from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate

from dotenv import dotenv_values

import asyncio

from aiob2 import Client

from pydantic import BaseModel

class FileDownload(BaseModel):
    file_name: str

class FileUpload(BaseModel):
    data : bytes


class FileAction(HTTPMethodView):
    
    "Class to handle file operations"

    config = dotenv_values(".env")

    key_id = config.get("AWS_ACCESS_KEY_ID")
    secret_key = config.get("AWS_SECRET_ACCESS_KEY")
    bucket_id = config.get("Bucket_ID")
    bucket_name = config.get("Bucket_Name")

    async def get(self, request: Request, body: FileDownload):
        async with Client(self.key_id,self.secret_key) as client:
            file = await client.download_file_by_name(
                file_name='test.jpg',
                bucket_name=self.bucket_name,
                content_type='pdf',      
            )
            return file
        
    async def post(self, request: Request, body: FileUpload):
        async with Client(self.key_id,self.secret_key) as client:
            file = await client.upload_file(
                content_bytes=body.data,
                file_name ='test.jpg',
                bucket_id = self.bucket_id,
            )
            return {"message": "File uploaded successfully."}
        


