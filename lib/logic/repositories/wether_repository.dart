import 'package:weather_app_bloc_http/data/models/weather.dart';
import 'package:weather_app_bloc_http/logic/services/https/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;

  WeatherRepository({required this.weatherApiServices});

  Future<Weather> getWeather(String city) async {
    return await weatherApiServices.getWeather(city);
  }
}