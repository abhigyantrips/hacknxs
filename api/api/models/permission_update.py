from typing import Literal
from pydantic import BaseModel


class PermissionUpdateData(BaseModel):
    type: Literal["doctor", "hospital"]
    id: str
    value: bool