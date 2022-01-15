import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final weather; // decodedData
  LocationScreen({this.weather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weathermodel = WeatherModel();
  int temp = 0;
  int id = 0;
  String? cityname;
  String? weathericon;
  String? userMessage;
  @override
  void initState() {
    UpdateUI(widget.weather);
    super.initState();
  }

  void UpdateUI(dynamic weather) {
    if (weather == null) {
      temp = 0;
      cityname = '';
      weathericon = 'ERREUR';
      userMessage = 'Can Not get Weather ! ';
      return;
    }
    setState(() {
      double temperature = weather['main']['temp'];
      temp = temperature.toInt();
      id = weather['weather'][0]['id'];
      cityname = weather['name'];
      weathericon = weathermodel.getWeatherIcon(id);
      userMessage = weathermodel.getMessage(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherstate =
                          await weathermodel.getLocationWeather();
                      UpdateUI(weatherstate);
                      // print(await weathermodel.getLocationWeather());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                       var TypedText = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                       if (TypedText !=null) {
                        var weatherData = await weathermodel.getCityWeather(TypedText);
                         UpdateUI(weatherData);
                       }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      // '${widget.weather['main']['temp']}',
                      '${temp}℃',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weathericon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$userMessage in $cityname!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
