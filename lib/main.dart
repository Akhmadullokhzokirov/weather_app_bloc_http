import 'package:flutter/material.dart';
import 'package:weather_app_bloc_http/logic/cubits/settings/settings_cubit.dart';
import 'package:weather_app_bloc_http/logic/cubits/weather/weather_cubit.dart';
import 'package:weather_app_bloc_http/logic/repositories/wether_repository.dart';
import 'package:weather_app_bloc_http/logic/services/https/weather_api_services.dart';
import 'package:weather_app_bloc_http/presentation/screens/home_screen.dart';
import 'package:http/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_http/presentation/screens/serach.dart';
import 'package:weather_app_bloc_http/presentation/screens/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherApiServices: WeatherApiServices(
          client: Client(),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => WeatherCubit(
              weatherRepository: ctx.read<WeatherRepository>(),
            ),
          ),
          BlocProvider(
            create: (ctx) => SettingsCubit(),
            ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: false,
            ),
            home: const HomeScreen(),
            routes: {
              SearchScreen.routeName:(ctx) => SearchScreen(),
              SettingScreen.routeName:(ctx) => const SettingScreen()

            },
            ),
      ),
    );
  }
}
