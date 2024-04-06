from api.app import appserver

from .login.doctor import DoctorLogin
from .login.patient import PatientLogin

appserver.add_route(PatientLogin.as_view(), "/login/patient")
appserver.add_route(DoctorLogin.as_view(), "/login/doctor")