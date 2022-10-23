from pydantic import BaseSettings

# let sqlalchemy handle the weather api access format
class Settings(BaseSettings):
    lat: float
    lon: float
    API_Key: str

    class Config:
        env_file = ".env"

settings = Settings()