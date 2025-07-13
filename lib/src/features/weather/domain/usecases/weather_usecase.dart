import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/src/core/exceptions/failure.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_params.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_result.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

/// Use case responsible for getting weather data
/// This follows the Single Responsibility Principle (SRP) from SOLID principles.
/// It abstracts the application logic from the UI and the data layer.
@injectable
class GetWeatherUseCase {
  final WeatherRepository _citiesRepository;

  GetWeatherUseCase(this._citiesRepository);

  Future<Either<Failure, WeatherResult>> call(WeatherParams params) =>
      _citiesRepository.getWeather(params);
}
