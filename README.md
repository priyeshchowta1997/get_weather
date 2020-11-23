# get_weather

A new Flutter package to fetch weather by giving city name.

## Getting Started

* Clone this repo
* Run flutter run (remember to open simulator or connect physical device, iOS auto run additional command pod install).

### Current Weather
For specific documentation on the current weather API, see the [OpenWeatherMap weather API docs](https://openweathermap.org/current)


## Setup

* To Run this project properly these is the setup you must follow.
* Create an instance of a WeatherModel is created using the API key from OpenWeatherMap.

```dart
import 'package:get_weather/get_weather.dart';


 WeatherModel weather = WeatherModel();

...

 you should also specify the  city name to obtain the weather details  


 var weatherData = await weather.getCityWeather(cityName);
```

Example output from OpenWeatherMap:

```json
{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  } 
```

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
