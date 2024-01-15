import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '4425438174c138e2231d62591bee3551';
const regularURL = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future<dynamic> getCityWeather(String cityName)async{
    var url ='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=4425438174c138e2231d62591bee3551&units=metric';

    NetworkingHelper netHelper = NetworkingHelper(url);
    var weatherData = await netHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData()async{
    Location locate = Location();
    await locate.getLocationInfo();
    NetworkingHelper netHelper = NetworkingHelper(
        '$regularURL?lat=${locate.latitude}&lon=${locate.longitude}&appid=$apiKey&units=metric');

    var weatherData = await netHelper.getData();

    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}