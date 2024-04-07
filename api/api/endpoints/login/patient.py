from api.models.patient_login import PatientLoginData
from api.utils import generate_jwt
from motor.motor_asyncio import AsyncIOMotorCollection
from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate
import aiohttp
from pydantic import BaseModel


class PatientLogin(HTTPMethodView):
    """Patient Login endpoint."""

    mapping = {}

    async def get(self, request: Request, uuid: str):
        """Get the patient login page."""
        try:
            # Check if the uuid is 12 digits long
            if len(uuid) != 12:
                return json({"message": "Invalid Aadhaar number"})
            # Convert the uuid to int (as its aadhaar number)
            aadhaar = int(uuid)
        except ValueError:
            return json({"message": "Invalid Aadhaar number"})
        # Send a request to the Authentication API
        with aiohttp.ClientSession() as session:
            body = {"aadhaar": aadhaar}
            headers = {"accept": "application/json", "content-type": "application/json"}

            headers.update({"x-api-key": request.app.config["SANDBOX_API_KEY"]})

            async with session.post(
                "https://api.sandbox.co.in/kyc/aadhaar/okyc/otp",
                data=body,
                headers=headers,
            ) as resp:
                data = await resp.json()
                try:
                    self.mapping[data["data"]["ref_id"]] = aadhaar
                except KeyError:
                    try:
                        return json(data["data"])
                    except KeyError:
                        return json(data["message"])

    @validate(json=PatientLoginData)
    async def post(self, request: Request, body: PatientLoginData):
        """Login a patient."""

        data = body.model_dump_json()

        # Send verification request to authentication API
        with aiohttp.ClientSession() as session:
            headers = {"accept": "application/json", "content-type": "application/json"}

            headers.update({"x-api-key": request.app.config["SANDBOX_API_KEY"]})
            headers.update({"authorization": request.app.ctx.token})

            async with session.post(
                "https://api.sandbox.co.in/kyc/aadhaar/okyc/otp/verify",
                data=body,
                headers=headers,
            ) as resp:
                data = await resp.json()
                if data.status == 200:
                    token = generate_jwt(
                        request.app, self.mapping[body.ref_id], validity=3600
                    )
                    return json({"token": token})
