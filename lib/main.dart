import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:queensu/screens/food_info.dart';
import 'package:queensu/screens/locations.dart';
import 'package:queensu/screens/welcome.dart';
import 'package:queensu/screens/initial_launch.dart';
import 'package:queensu/screens/meal_periods.dart';

Future<void> main() async {
  await dotenv.load();

  // change properties nav stuff
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Roboto'),
    initialRoute: '/',
    routes: {
      '/': (context) => const InitialLaunch(),
      '/welcome': (context) => const Welcome(),
      '/locations': (context) => const Locations(),
      '/meal_periods': (context) => const MealPeriods(),
      '/food_info': (context) => const FoodInfo(),
    },
  ));
}
