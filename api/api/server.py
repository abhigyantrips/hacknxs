import os
from signal import signal, SIGINT
import asyncio
import uvloop

from app import app


host = os.environ.get("HOST", "0.0.0.0")
port = int(os.environ.get("PORT", "8080"))

asyncio.set_event_loop(uvloop.new_event_loop())
if hasattr(app.config, "DEBUG"):
    app.run(host=host, port=port, debug=True)
else:
    loop = asyncio.get_event_loop()
    server = app.create_server(host=host, port=port)
    task = asyncio.ensure_future(server)
    signal(SIGINT, lambda s, f: loop.stop())
    try:
        loop.run_forever()
    except:
        loop.stop()
