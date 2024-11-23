import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_bloc_http/logic/cubits/settings/settings_cubit.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super( ) {

    on<ToggleTemperatureEvent>(_toggleTemperature);
  }

  void _toggleTemperature(
      ToggleTemperatureEvent event, Emitter<SettingsState> emit) {
    if (state.temUnits == TemUnits.celcius) {
      emit(const SettingsState(temUnits: TemUnits.fahrenheit));
    } else {
      emit(const SettingsState(temUnits: TemUnits.celcius));
    }
  }
}
