from pydantic import BaseModel


class PatientLoginData(BaseModel):
    otp: str
    ref_id: str
