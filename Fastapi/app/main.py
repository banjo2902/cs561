from fastapi import FastAPI
from .routers import weather

app = FastAPI()

app.include_router(weather.router)  # refer to weather router


@app.get("/")  # decorator
def root():
    return {"message": "Hello World! Welcome to my CS561 API!"}
