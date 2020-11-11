# Sweater Weather 
--------

### Description 
This is an app that allows users to plan road trips. It allows them to see the current weather as well as the forecasted weather at the destination. It is a service-oriented architecture. The front-end will communicate with your back-end through an API. I had to expose that API that satisfies the front-end team’s requirements (viewed through Wireframes). 

### Learning Goals 
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Local Setup
Versioning: 
* ruby 2.5.3
* rails 5.2.4.4
Download & install: 
1. `git clone https://github.com/judithpillado/sweater_weather`
2. `cd sweater_weather`
3. `bundle install`
4. `rails db:{create,migrate}
5. `figaro install` (it creates the file: `config/application.yml` which is where you add all the environment variables that hold your API keys) 
6. Get your API keys using the following sites (you will have to create an account to receive an API key): 
    * [MapQuest](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)
    * [OpenWeather](https://openweathermap.org/appid)
    * [Pexels](https://www.pexels.com/api/?locale=en-US)
6. Add the API keys you obtained to `application.yml` in the following format: 
    ```
    MAPQUEST_API_KEY: <your mapquest key>
    OPEN_WEATHER_API_KEY: <your openweather key>
    PEXELS_API_KEY: <your pexels key>
    ```
7. `rails s` on your local server and send requests to `localhost:3000` using Postman.  
8. run the test suite: `bundle exec rspec`

### API Endpoints 
**1.a - Retrieve weather for a city** 
Request: 
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
``` 
Response Example: 
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "wind_speed": "4 mph",
          "wind_direction": "from NW",
          etc
        },
        {...} etc
      ]
    }
  }
}
```
<br> 
**1.b - Background image for the city** 
Request: 
```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
``` 
Response Example: 
``` 
status: 200
body:

{
  "data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "credit": {
          "source": "pixabay.com",
          "author": "quinntheislander",
          "logo": "https://pixabay.com/static/img/logo_square.png"
        }
      }
    }
  }
}
``` 
<br> 
**2 - User Registration** 
Request: 
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
 ``` 
 Response Example: 
 ```
 status: 201
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
``` 
<br> 
**3 - Login** 
Request: 
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```
Response: 
```
status: 200
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```
<br> 
**4 - Road Trip** 
Request: 
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
Response Example: 
``` 
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```
