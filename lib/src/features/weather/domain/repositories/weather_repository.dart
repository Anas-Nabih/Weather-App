import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/exceptions/failure.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_params.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_result.dart';

///  Abstract definition of the Weather Repository
/// Used by use cases to interact with data layer without knowing the implementation.
abstract class WeatherRepository {
  Future<Either<Failure, WeatherResult>> getWeather(WeatherParams params);
}
