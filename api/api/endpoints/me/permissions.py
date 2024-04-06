from api.decorators.authorized import authorized
import jwt
from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate
from sanic.log import logger

class PermissionsView(HTTPMethodView):
    
    @authorized
    async def get(self, request: Request) -> json:
        jwt_data = jwt.decode(request.token, key=request.app.config["PUB_KEY"], algorithms=["RS256"])

        user_id = jwt_data["user_id"]

        collection = request.app.ctx.db["patients"]
        patient = await collection.find_one({"aadhaar_number": user_id})
        if patient is None:
            return json({"error": "Patient not found"}, 404)
    
        logger.info(patient)
        
        doctors_authorized = patient.get("doctors_authorised", [])
        hospitals_authorized = patient.get("hospitals_authorised", [])

        return json({
            "doctors": doctors_authorized,
            "hospitals": hospitals_authorized
        })