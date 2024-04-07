from pydantic import BaseModel


class DoctorLoginData(BaseModel):
    identifier: str
    secret: str
