import 'package:flutter/material.dart';
import 'package:get_weather/get_weather.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;

  String weatherMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Weather ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[600],
        automaticallyImplyLeading: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(color: Colors.blue[600]),
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () async {
                    var weatherData = await weather.getCityWeather(cityName);
                    print(weatherData);
                    setState(() {
                      if (weatherData == null) {
                        temperature = 0;
                        weatherIcon = 'Error';
                        weatherMessage = 'Unable to get weather data';
                        cityName = '';
                        return;
                      }
                      double temp = weatherData['main']['temp'];
                      print(temp);
                      temperature = temp.toInt();
                      weatherMessage = weatherData['weather'][0]['description'];

                      cityName = weatherData['name'];
                    });
                    // Navigator.pop(context, cityName);
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.blue[600],
                  child: Text('Get Weather',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Temperature :"),
                        Text('$temperature°'),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("City name :"),
                        Text("$cityName"),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Description :"),
                        Text("$weatherMessage"),
                      ],
                    ),
                  ],
                ),
              ),
              // FlatButton(
              //   onPressed: () {
              //     Navigator.pop(context, cityName);
              //   },
              //   child: Text(
              //     'Get Weather',
              //     style: TextStyle(
              //       fontSize: 30.0,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
