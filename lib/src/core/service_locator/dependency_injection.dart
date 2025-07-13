import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/core/network/headers_interceptor.dart';
import 'package:weather_app/src/core/network/network_info.dart';
import 'package:weather_app/src/core/network/response_validation_interceptor.dart';
import 'package:weather_app/src/core/service_locator/dependency_injection.config.dart';

/// Global service locator instance from get_it package.
final sl = GetIt.instance;


/// App initialization function.
/// - Loads environment variables.
/// - Initializes screen size utilities.
/// - Configures dependency injection.
Future<void> init() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await configureDependencies();
}

@InjectableInit(asExtension: true, preferRelativeImports: true)
Future<void> configureDependencies() async {
  await sl.init();
}

@module
abstract class DioModule {
  Dio get dio =>
      Dio()
        ..interceptors.addAll([
          HeadersInterceptor(),
          ResponseValidationInterceptor(),
        ]);
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get sharePreferences =>
      SharedPreferences.getInstance();
}

@module
abstract class AppModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @LazySingleton(as: NetworkInfo)
  NetworkInfoImpl provideNetworkInfo(Connectivity connectivity) =>
      NetworkInfoImpl(connectivity);
}
