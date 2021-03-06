import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = 'a08eac487f221c2d673f572986bd84e3' ;
const WeathermapOrg = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather (String cityName) async  {
   NetworkHelper cityWeather =   NetworkHelper(url: '$WeathermapOrg?q=$cityName&appid=$apiKey&units=metric');
   var WeatherData = await cityWeather.getWeather();
  return WeatherData;
  }

  Future<dynamic> getLocationWeather () async  {
    Location userLocation = Location();
    await userLocation.getCurrentlocation();
    NetworkHelper userweather =  NetworkHelper(url: "$WeathermapOrg?lat=${userLocation.latitude}&lon=${userLocation.longitude}&appid=$apiKey&units=metric");
    var weatherData = await userweather.getWeather();// aka = jsonDecode(response.body) in the network page
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
