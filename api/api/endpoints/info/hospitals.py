from api.models.query import Query
from api.utils import generate_jwt
from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate


class HospitalInfo(HTTPMethodView):
    """Insurance Info endpoint."""

    @validate(query=Query)
    async def get(self, request: Request, query: Query):
        """Get insurance info for a hospital."""
        if query.query:
            hospital_id = query.query

            collection = request.app.ctx.db["hospital"]
            doc = await collection.find_one({"hospital_id": hospital_id})

            if doc is None:
                return json(
                    {
                        "authenticated": False,
                        "message": "Hospital not found",
                        "error": "Not Found",
                    },
                    status=404,
                )

            # Calculate the rating
            average = 0
            if doc["ratings"]:
                total = 0
                for rating in doc["ratings"]:
                    total += float(rating["rating"])
                average = total / len(doc["ratings"])
            # Remove _id and ratings
            doc.pop("_id")
            doc.pop("ratings")
            doc["rating"] = average

            return json(doc)
        else:
            # Return all hospitals
            collection = request.app.ctx.db["hospital"]
            docs = []
            async for doc in collection.find():
                if doc["ratings"]:
                    total = 0
                    for rating in doc["ratings"]:
                        total += float(rating["rating"])
                    average = total / len(doc["ratings"])
                # Remove _id and ratings
                doc.pop("_id")
                doc.pop("ratings")
                doc["rating"] = average
            
            return json(docs)