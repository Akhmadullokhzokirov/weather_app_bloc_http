import 'package:flutter/material.dart';
import 'package:weather_app_bloc_http/data/models/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_http/logic/cubits/settings/settings_cubit.dart';

class Temperature extends StatefulWidget {
  const Temperature({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {

  String _showTemperature (double temp) {
    final tempUnit = context.watch<SettingsCubit>().state.temUnits;

    if(tempUnit == TemUnits.fahrenheit) {
      return '${(temp * 9 / 5 + 32).toStringAsFixed(0)}°F';
    }
    return '${temp.toStringAsFixed(0)}°C';
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _showTemperature(widget.weather.temperature),
          style: const TextStyle(
              fontSize: 70, color: Colors.white, height: 0.1),
        ),
        Row(
          children: [
            Image.network(
                'https://openweathermap.org/img/wn/${widget.weather.icon}@2x.png',
                width: 100,
                height: 100,
                ),
            Text(
              widget.weather.main,
              style: const TextStyle(
                  color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ],
    );
  }
}


