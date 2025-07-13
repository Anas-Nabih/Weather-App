import 'package:weather_app/src/features/weather/domain/entities/current_entity.dart';
import 'package:weather_app/src/features/weather/domain/entities/location_entity.dart';

///  Base class for weather data used across the app.
/// It should contain only the fields that the app truly needs.
class WeatherEntity {
  final LocationEntity location;
  final CurrentEntity current;
  final String cityName;
  final double temperature;
  final String condition;
  final String iconUrl;
  final bool isCached;

  const WeatherEntity({
    required this.location,
    required this.current,
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
    this.isCached = false,
  });
}
