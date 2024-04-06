from api.app import appserver

from .login.doctor import DoctorLogin
from .login.patient import PatientLogin

from .rating.doctor import DoctorRating
from .rating.hospital import HospitalRating

from .file.file import FileAction
from .file.all_file import AllFiles

appserver.add_route(PatientLogin.as_view(), "/login/patient")
appserver.add_route(DoctorLogin.as_view(), "/login/doctor")

appserver.add_route(DoctorRating.as_view(), "/rating/doctor/<doctor_id:strorempty>")
appserver.add_route(HospitalRating.as_view(), "/rating/hospital/<hospital_id:strorempty>")

appserver.add_route(FileAction.as_view(), "/file")
appserver.add_route(AllFiles.as_view(), "/file/all/<aadhaar_number:strorempty>")