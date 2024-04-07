from pydantic import BaseModel


class Rating(BaseModel):
    rating: float
