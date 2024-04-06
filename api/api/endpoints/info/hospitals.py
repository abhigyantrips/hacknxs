from sanic import Request, json
from sanic.views import HTTPMethodView


class HospitalInfo(HTTPMethodView):
    """Insurance Info endpoint."""

    async def get(self, request: Request,):
        """Get insurance info for a hospital."""
        hospital_id = request.args.get("query", None)
        if hospital_id is not None:

            collection = request.app.ctx.db["hospitals"]
            doc = await collection.find_one({"hospital_id": str(hospital_id)})

            if doc is None:
                return json(
                    {
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
            collection = request.app.ctx.db["hospitals"]
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
                docs.append(doc)
            
            return json(docs)