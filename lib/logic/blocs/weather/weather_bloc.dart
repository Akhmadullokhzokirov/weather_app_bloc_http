import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_bloc_http/data/models/weather.dart';
import 'package:weather_app_bloc_http/logic/repositories/wether_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  
  WeatherBloc() : super(WeatherInitial()) {
    on<LoadWeatherEvent>(_getWeather);
  }
   Future<void> _getWeather(LoadWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await WeatherRepository.getWeather();
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
