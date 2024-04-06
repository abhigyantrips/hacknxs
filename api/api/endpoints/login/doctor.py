from api.models.doctor_login import DoctorLoginData
from api.utils import generate_jwt
from motor.motor_asyncio import AsyncIOMotorCollection
from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate
import bcrypt


class DoctorLogin(HTTPMethodView):
    """Doctor Login endpoint."""

    @validate(json=DoctorLoginData)
    async def post(self, request: Request, body: DoctorLoginData):
        """Login a doctor."""

        user = body.identifier
        password = body.secret

        collection = request.app.ctx.db["authentication"]
        doc = await collection.find_one({"auth_type": "USER", "username": user})

        # Check if user exists
        if doc is None:
            return json(
                {
                    "authenticated": False,
                    "message": "User not found",
                    "error": "Not Found",
                },
                status=404,
            )

        password_hash = doc.get("password_hash")

        # Verify the password for existing users.
        verified = bcrypt.checkpw(password.encode(), password_hash)

        # If verified, generate JWT.
        if verified:
            jwt_data = {
                "user_id": str(doc["_id"]),
                "hospital_id": doc["hospital_id"],
            }

            jwt_ = await generate_jwt(
                app=request.app, data=jwt_data, validity=3600, type="doctor"
            )
            json_payload = {"identifier": jwt_, "authenticated": True}

        else:
            # If not verified, return error.
            json_payload = {
                "authenticated": False,
                "message": "Incorrect password",
                "error": "Unauthorized",
            }

            status = 401

        return json(json_payload, status=status)
