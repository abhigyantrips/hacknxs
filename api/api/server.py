import aiohttp
import motor.motor_asyncio as async_motor
from dotenv import dotenv_values
from sanic import Request, Sanic, response
from sanic.log import logger
from .utils import generate_jwt

from .app import app


logger.debug("Loading ENV")
config = dotenv_values(".env")

# Read the public and private keys and add them to the config.
with open("public-key.pem") as public_key_file:
    config["PUB_KEY"] = public_key_file.read()

with open("private-key.pem") as private_key_file:
    config["PRIV_KEY"] = private_key_file.read()


# Try to get state from the ENV, defaults to being dev.
is_prod: str = config.get("IS_PROD", "false")

# Convert the string to a bool and update the config with the bool.
config.update({"IS_PROD": is_prod.lower() == "true"})

app.config.update(config)


@app.listener("before_server_start")
async def register_db(app: Sanic):
    logger.info("Connecting to MongoDB.")
    connection = app.config.get("MONGO_CONNECTION_URI")

    if connection is None:
        logger.error("Missing MongoDB URL")
        app.stop(terminate=True)

    client = async_motor.AsyncIOMotorClient(
        connection,
        maxIdleTimeMS=10000,
        minPoolSize=10,
        maxPoolSize=50,
        connectTimeoutMS=10000,
        retryWrites=True,
        waitQueueTimeoutMS=10000,
        serverSelectionTimeoutMS=10000,
    )

    logger.info("Connected to MongoDB.")

    # Add MongoDB connection client to ctx for use in other modules.
    app.ctx.db_client = client
    app.ctx.db = client["hacknxs"]

    if app.config["IS_PROD"]:
        async with aiohttp.ClientSession() as session:
            headers = {
                "accept": "application/json",
                "x-api-key": app.config["SANDBOX_API_KEY"],
                "x-api-secret": app.config["SANDBOX_API_SECRET"],
            }
            async with session.post(
                "https://api.sandbox.co.in/authenticate", headers=headers
            ) as resp:
                data = await resp.json()
                if resp.status != 200:
                    app.ctx.token = data["access_token"]
                else:
                    logger.error("Failed to authenticate with the Aadhaar Verification API")
                    app.stop(terminate=True)


@app.listener("after_server_stop")
async def close_connection(app: Sanic, loop):
    app.ctx.db_client.close()
    logger.info("Disconnected from MongoDB")


@app.get("/")
async def get_root(request: Request):
    return response.text("Server Online")


if __name__ == "__main__":
    # Check for Production environment
    is_prod = app.config["IS_PROD"]

    # Use a KWARGS dict to pass to app.run dynamically
    kwargs = {"access_log": True, "host": "0.0.0.0"}

    if not is_prod:
        # If its NOT production
        kwargs["debug"] = True
        kwargs["auto_reload"] = True

    # Run the API Server
    app.run(**kwargs)
