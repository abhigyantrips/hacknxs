from api.decorators.authorized import authorized
from api.models.rating import Rating
import jwt
from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate
class DoctorRating(HTTPMethodView):
    """Doctor Rating endpoint."""

    async def get(self, request: Request, doctor_id: str):
        """Get doctor ratings."""
        collection = request.app.ctx.db["doctors"]
        doctor = await collection.find_one({"doctor_id": doctor_id}, {"ratings": 1})
        if doctor is None:
            return json({"error": "Doctor not found."}, 404)
        
        # Calculate the average rating.
        average = 0
        if doctor["ratings"]:
            total = 0
            for rating in doctor["ratings"]:
                total += float(rating["rating"])
            average = total / len(doctor["ratings"])
        return json({"rating": round(average, 2)})
    

    # @authorized
    @validate(json=Rating)
    async def post(self, request: Request, doctor_id: str, body: Rating):
        """Rate a doctor."""
        collection = request.app.ctx.db["doctors"]
        doctor = await collection.find_one({"doctor_id": doctor_id}, {"ratings": 1})
        if doctor is None:
            return json({"error": "Doctor not found."}, 404)
        
        jwt_data = jwt.decode(request.token, key=request.app.config["PUB_KEY"], algorithms=["RS256"])

        # Check if the user has already rated the doctor.
        for rating in doctor["ratings"]:
            if rating["id"] == jwt_data["user_id"]:
                # Update the rating.
                await collection.update_one(
                    {"doctor_id": doctor_id, "ratings.id": jwt_data["user_id"]},
                    {"$set": {"ratings.$.rating": body.rating}}
                )
                return json({"message": "Rating updated."})
            
        # Add the rating.
        await collection.update_one(
            {"doctor_id": doctor_id},
            {"$push": {"ratings": {"id": jwt_data["user_id"], "rating": body.rating}}}
        )
        return json({"message": "Rating added."})