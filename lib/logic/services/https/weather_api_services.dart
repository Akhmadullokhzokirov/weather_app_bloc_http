import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather_app_bloc_http/data/constants/constants.dart';
import 'package:weather_app_bloc_http/data/models/weather.dart';
import 'package:weather_app_bloc_http/logic/services/exceptions/weather_exception.dart';

class WeatherApiServices {
  final http.Client client;
  WeatherApiServices({required this.client});

  Future<Weather> getWeather(String city) async {
    final uri = Uri.parse(
        '$base_url?q=${city.toLowerCase()}&units=metric&appid=$api_key');

    try {
      final response = await client.get(uri);
      print(response.body);
      if (response.statusCode >= 400) {
        throw Exception(response.reasonPhrase);
      }
      final responseBody = jsonDecode(response.body);
      if (responseBody == null) {
        throw WeatherException('Cannot get weather for $city');
      }
      final data = responseBody as Map<String, dynamic>;
      final weatherData = data['weather'][0];
      final mainData = data['main'];

      final Weather weather = Weather(
          id: weatherData['id'].toString(),
          main: weatherData['main'],
          desc: weatherData['description'],
          icon: weatherData['icon'],
          temperature: mainData['temp'],
          city: data['name']);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
