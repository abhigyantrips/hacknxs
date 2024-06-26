from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate


class InsuranceInfo(HTTPMethodView):
    """Insurance Info endpoint."""

    async def get(self, request: Request):
        insurance = request.args.get("query", None)
        if insurance is not None:
            collection = request.app.ctx.db["insurance"]
            doc = await collection.find_one({"provider": insurance})

            if doc is None:
                return json(
                    {
                        "message": "Insurance not found",
                        "error": "Not Found",
                    },
                    status=404,
                )

            # Remove _id
            doc.pop("_id")

            return json(doc)
        else:
            # Return all insurances
            collection = request.app.ctx.db["insurance"]
            docs = []
            async for doc in collection.find():
                doc.pop("_id")
                docs.append(doc)

            return json(docs)
