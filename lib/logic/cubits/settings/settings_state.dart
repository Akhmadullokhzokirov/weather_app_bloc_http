part of 'settings_cubit.dart';

enum TemUnits {
  celcius,
  fahrenheit
}

@immutable
 class SettingsState {
  final TemUnits? temUnits;

 const SettingsState({this.temUnits});
}

