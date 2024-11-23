import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(temUnits: TemUnits.celcius));

  void toggleTemperature() {
    if (state.temUnits == TemUnits.celcius) {
      emit(const SettingsState(temUnits: TemUnits.fahrenheit));
    } else {
      emit(const SettingsState(temUnits: TemUnits.celcius));
    }
  }
}
