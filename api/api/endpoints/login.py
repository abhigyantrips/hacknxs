from motor.motor_asyncio import AsyncIOMotorCollection
from sanic import Request, json
from sanic.views import HTTPMethodView
from sanic_ext import validate

class Login(HTTPMethodView):
    """Login endpoint."""

    async def get(self, request):
        ...

    async def post(self, request):
        ...
