part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class LoadWeatherEvent extends WeatherEvent {
  final String city;

  LoadWeatherEvent(this.city);
}
