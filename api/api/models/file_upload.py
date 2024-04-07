from pydantic import BaseModel


class FileUpload(BaseModel):
    data: bytes
    aadhaar_number: str
    file_name: str
