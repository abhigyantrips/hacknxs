from api.app import app

from .login.doctor import DoctorLogin
from .login.patient import PatientLogin

app.add_route(PatientLogin.as_view(), "/login/patient")
app.add_route(DoctorLogin.as_view(), "/login/doctor")