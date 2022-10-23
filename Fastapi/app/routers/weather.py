from fastapi import APIRouter
# import httpx
# from ..config import settings

router = APIRouter()

# lat = settings.lat ; lon = settings.lon ; API_key = settings.API_Key

# url = f"https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API_key}"
url = {"coord":{"lon":-123.777,"lat":44.5646},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":296.52,"feels_like":296.04,"temp_min":292.99,"temp_max":300.18,"pressure":1008,"humidity":43},"visibility":10000,"wind":{"speed":2.57,"deg":320},"clouds":{"all":0},"dt":1665885183,"sys":{"type":2,"id":2040223,"country":"US","sunrise":1665844092,"sunset":1665883742},"timezone":-25200,"id":5720727,"name":"Corvallis","cod":200}

@router.get("/data/2.5/weather")
def get_weather():
    # r = httpx.get(url)
    # print(r.status_code)
    # print("r content : ", r.text)
    return url
