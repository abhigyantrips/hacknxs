from api.app import app

from .login import Login

app.add_route(Login.as_view(), "/login")