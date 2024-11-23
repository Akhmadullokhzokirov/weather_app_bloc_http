import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_bloc_http/data/models/weather.dart';
import 'package:weather_app_bloc_http/logic/repositories/wether_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  Future<void> getWeather(String city) async {
    emit(WeatherLoading());

    try {
      final weather = await weatherRepository.getWeather(city);
     // print(weather.temperature);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
