import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';


const spinkit = SpinKitHourGlass(
  color: Colors.white30,
  duration: Duration(seconds: 2),

);



class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationData() async {
   WeatherModel UserWeather = WeatherModel();
   var locationWeather = await UserWeather.getLocationWeather(); // decodedata here !!!
 Navigator.push(context, MaterialPageRoute(builder: (context) {
   return LocationScreen(weather : locationWeather);  //passing our DecodedData to location screen  !!!
 }));

  }

  @override
  void initState() {

    super.initState();
    // print("Initstat called !! ");

    getLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
    // print('deactivate called ! ');
  }

  @override
  Widget build(BuildContext context) {
    // print('build called');
    return Scaffold(
      body: spinkit,
    );
  }
}
