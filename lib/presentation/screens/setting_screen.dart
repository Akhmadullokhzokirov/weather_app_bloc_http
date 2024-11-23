import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_http/logic/cubits/settings/settings_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: ListTile(
        title: const Text('Temperature'),
        subtitle: const Text('Celcius / Fahrenheit (default: Celcius)'),
        trailing: Switch.adaptive(
            value: context.watch<SettingsCubit>().state.temUnits ==
                    TemUnits.celcius
                ? true
                : false,
            onChanged: (value) {
              context.read<SettingsCubit>().toggleTemperature();
            }),
      ),
    );
  }
}
