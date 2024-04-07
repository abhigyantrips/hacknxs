import requests
import json

url = "http://localhost:8000/file"

data = {"file_name": "page.tsx"}

response = requests.get(url, data=json.dumps(data))

with open(data["file_name"], "wb") as f:
    f.write(response.content)
