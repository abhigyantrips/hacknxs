from api.app import app

from .login.doctor import DoctorLogin
from .login.patient import PatientLogin

from .rating.doctor import DoctorRating
from .rating.hospital import HospitalRating

app.add_route(PatientLogin.as_view(), "/login/patient")
app.add_route(DoctorLogin.as_view(), "/login/doctor")

app.add_route(DoctorRating.as_view(), "/rating/doctor/<doctor_id:strorempty>")
app.add_route(HospitalRating.as_view(), "/rating/hospital/<hospital_id:strorempty>")