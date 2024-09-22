import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlng/latlng.dart';
import 'package:geolocator/geolocator.dart';

class UrlHelper {

  static const url = "https://api.openweathermap.org/data/2.5";

  static String getCurrentWeather(Position position) {

    return "$url/weather?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=fd9e22158126001ffdfad0d1baea77dd";
  }

  static String getForecast(Position position) {

    return "$url/forecast?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=fd9e22158126001ffdfad0d1baea77dd";
  }

  static String getCurrentWeatherWithCity(String cityName) {

    return "$url/weather?q=$cityName&units=metric&appid=fd9e22158126001ffdfad0d1baea77dd";
  }

  static String getForecastWithCity(String cityName) {

    return "$url/forecast?q=$cityName&units=metric&appid=fd9e22158126001ffdfad0d1baea77dd";
  }
  // static String urlForPlaceKeywordAndLocation(String keyword, double latitude, double longitude) {
  //   return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&type=restaurant&keyword=$keyword&key=AIzaSyDhCn-6GFiJTz-OcLhR2-2YjJra3jsx-dA";
  // }

}