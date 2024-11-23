import 'package:flutter/material.dart';
import 'package:weather_app_bloc_http/presentation/screens/serach.dart';
import 'package:weather_app_bloc_http/presentation/screens/setting_screen.dart';

class WeatherMenu extends StatelessWidget {
  final Function getWeather;
  const WeatherMenu(
      {super.key, required this.imagePath, required this.getWeather});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final _city =
                await Navigator.pushNamed(context, SearchScreen.routeName);

            if (_city != null) {
              getWeather(_city as String);
            }
          },
          icon: const Icon(
            Icons.search,
          ),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SettingScreen.routeName);
          },
          icon: const Icon(Icons.settings),
          color: Colors.white,
        )
      ],
    );
  }
}
