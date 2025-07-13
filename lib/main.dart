import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/app.dart';
import 'package:weather_app/src/core/helper/cubit_observer.dart';
import 'package:weather_app/src/core/service_locator/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  Bloc.observer = AppCubitObserver();

  runApp(const MyApp());
}
