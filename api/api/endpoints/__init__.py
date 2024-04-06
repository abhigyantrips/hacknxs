from api.app import appserver

from .login.doctor import DoctorLogin
from .login.patient import PatientLogin

from .rating.doctor import DoctorRating
from .rating.hospital import HospitalRating

from .me.grant import PermissionsGrantView
from .me.permissions import PermissionsView
from .me.revoke import PermissionsRevokeView

from .file.file import FileAction
from .file.all_file import AllFiles

from .info.insurance import InsuranceInfo
from .info.hospitals import HospitalInfo

appserver.add_route(PatientLogin.as_view(), "/login/patient")
appserver.add_route(DoctorLogin.as_view(), "/login/doctor")

appserver.add_route(DoctorRating.as_view(), "/rating/doctor/<doctor_id:strorempty>")
appserver.add_route(HospitalRating.as_view(), "/rating/hospital/<hospital_id:strorempty>")

appserver.add_route(PermissionsGrantView.as_view(), "/me/grant")
appserver.add_route(PermissionsView.as_view(), "/me/permissions")
appserver.add_route(PermissionsRevokeView.as_view(), "/me/revoke")

appserver.add_route(FileAction.as_view(), "/file")
appserver.add_route(AllFiles.as_view(), "/file/all/<aadhaar_number:strorempty>")

appserver.add_route(InsuranceInfo.as_view(), "/info/insurance")
appserver.add_route(HospitalInfo.as_view(), "/info/hospital")