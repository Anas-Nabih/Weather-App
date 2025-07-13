import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_entity.dart';


/// The output of the use case operation.
/// Could represent a response or wrapper around the entity.
class WeatherResult extends Equatable {
  final WeatherEntity weather;
  final bool isCached;
  final bool hasNetworkError;

  const WeatherResult({
    required this.weather,
    this.isCached = false,
    this.hasNetworkError = false,
  });

  @override
  List<Object> get props => [weather, isCached, hasNetworkError];
}