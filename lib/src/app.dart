import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/features/weather/presentation/pages/weather_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:
          (context, child) => MaterialApp(
            title: "Weather App",
            debugShowCheckedModeBanner: false,
            home: const WeatherScreen(),
            theme: ThemeData().copyWith(scaffoldBackgroundColor: Colors.white),
          ),
    );
  }
}
