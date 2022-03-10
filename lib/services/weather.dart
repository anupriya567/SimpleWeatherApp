import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:climax/services/location.dart';
const api_key = 'a21e2cc6503f51e92ecde29242a8fd34';

class WeatherModel {
  Future<dynamic> getWeatherDataUsingCityName(String cityName)
  async{
    http.Response response = await http.get((Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$api_key&units=metric'
    )));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
    // else {
    //   return response.statusCode;
    // }
  }

  Future<dynamic> getWeatherData() async
  {

    Location location = Location();
    await location.getCurrentLocation();

    http.Response response = await http.get((Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api_key&units=metric')));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
    // else {
    //   return response.statusCode;
    // }
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
