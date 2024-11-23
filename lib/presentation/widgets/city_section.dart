import 'package:flutter/material.dart';
import 'package:weather_app_bloc_http/data/models/weather.dart';
import '../../helpers/extensions/string_extensions.dart';


class CitySection extends StatelessWidget {
  const CitySection({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weather.city.capitaliSizeString(),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        Text(
          weather.desc,
          style: const TextStyle(
              fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}