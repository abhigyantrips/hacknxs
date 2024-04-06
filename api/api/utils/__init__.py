from datetime import datetime, timedelta, timezone
from typing import Literal

import jwt
from jwt import InvalidTokenError
from sanic import Request, Sanic

import uuid


async def check_request_for_authorization_status(request: Request) -> bool:
    """Checks if the given request is containing a basic auth token"""
    if not request.token:
        return False

    try:
        jwt.decode(request.token, key=request.app.config["PUB_KEY"], algorithms="RS256")
    except InvalidTokenError:
        return False

    return True


async def generate_jwt(
    app: Sanic, data: dict, validity: int, type: Literal["doctor", "patient"]
) -> str:
    """Generates JWT with given data"""
    now = datetime.now(tz=timezone.utc)
    expire = now + timedelta(minutes=validity)

    data.update({"exp": expire, "iat": now, "nbf": now, "target": type})
    return jwt.encode(data, app.config["PRIV_KEY"], algorithm="RS256")

async def generate_uuid() -> str:
    """Generates a UUID"""
    return str(uuid.uuid4())