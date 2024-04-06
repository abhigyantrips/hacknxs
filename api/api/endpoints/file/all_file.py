from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate

from motor.motor_asyncio import AsyncIOMotorCollection


class AllFiles(HTTPMethodView):
    # Class to handle file operations

    async def get(self, request: Request, aadhaar_number: str):
        patients: AsyncIOMotorCollection = request.app.ctx.db["patients"]

        # Check if the patient exists
        patient = await patients.find_one({"aadhaar_number": aadhaar_number})

        if patient is None:
            return json({"message": "Patient not found."}, status=404)

        # Get all the files of the patient from files dictionary inside history array
        files = patient.get("files", [])

        return json({"files": files, "message": "List of files returned."}, status=200)
