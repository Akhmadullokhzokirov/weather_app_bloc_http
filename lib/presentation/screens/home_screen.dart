import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app_bloc_http/logic/cubits/weather/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_http/presentation/screens/serach.dart';
import 'package:weather_app_bloc_http/presentation/widgets/city_section.dart';
import 'package:weather_app_bloc_http/presentation/widgets/temperature.dart';
import 'package:weather_app_bloc_http/presentation/widgets/weather_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = 'london';

  @override
  void initState() {
    super.initState();
    _getWeather('london');
  }

  void _getWeather(String city) {
    context.read<WeatherCubit>().getWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<WeatherCubit, WeatherState>(
      listener: (ctx, state) async {
        if (state is WeatherError) {
          await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text('Error'),
                    content: Text(state.message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('Ok'),
                      ),
                    ],
                  ));
          if (state.message.toLowerCase().contains('not found')) {
            _getWeather('london');
          }
        }
      },
      builder: (ctx, state) {
        if (state is WeatherInitial) {
          return const Center(
            child: Text('Select a city'),
          );
        }
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WeatherLoaded) {
          final weather = state.weather;
          final mainWeather = weather.main.toLowerCase();
          String imagePath = '';

          if (mainWeather.contains('rain')) {
            imagePath = 'assets/images/rainy.jpeg';
          } else if (mainWeather.contains('cloud')) {
            imagePath = 'assets/images/Clouds.webp';
          } else if (mainWeather.contains('snowy')) {
            imagePath = 'assets/images/snowy.jpeg';
          } else if (mainWeather.contains('sun')) {
            imagePath = 'assets/images/sunny.jpeg';
          } else {
            imagePath = 'assets/images/night.jpeg';
          }
          return Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
              ),
             
              Positioned(
                right: 0,
                top: 40,
                child: WeatherMenu(imagePath: imagePath , getWeather: _getWeather,),
              ),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CitySection(weather: weather),
                    Temperature(weather: weather)
                  ],
                ),
              )),
            ],
          );
        }
        return Container();
      },
    ));
  }
}
