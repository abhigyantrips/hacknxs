from api.decorators.authorized import authorized
from api.models.permission_update import PermissionUpdateData
import jwt
from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate


class PermissionsGrantView(HTTPMethodView):

    @authorized
    @validate(json=PermissionUpdateData)
    async def post(self, request: Request, body: PermissionUpdateData) -> json:
        jwt_data = jwt.decode(
            request.token, key=request.app.config["PUB_KEY"], algorithms=["RS256"]
        )

        user_id = jwt_data["user_id"]

        collection = request.app.ctx.db["patients"]
        patient = await collection.find_one({"aadhaar_number": user_id})
        if patient is None:
            return json({"error": "Patient not found"}, 404)

        if body.type == "doctor":
            collection = request.app.ctx.db["doctors"]
            doctor = await collection.find_one({"doctor_name": body.id})
            if doctor is None:
                return json({"error": "Doctor not found"}, 404)

            if body.value:
                await request.app.ctx.db["patients"].update_one(
                    {"aadhaar_number": user_id}, {"$addToSet": {"doctors_authorised": body.id}}
                )
                return json({"message": "Doctor authorised"})

        elif body.type == "hospital":
            collection = request.app.ctx.db["hospitals"]
            hospital = await collection.find_one({"hospital_name": body.id})
            if hospital is None:
                return json({"error": "Hospital not found"}, 404)

            if body.value:
                await request.app.ctx.db["patients"].update_one(
                    {"aadhaar_number": user_id},
                    {"$addToSet": {"hospitals_authorised": body.id}},
                )
                return json({"message": "Hospital authorised"})
