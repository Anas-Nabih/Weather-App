import 'package:weather_app/src/features/weather/data/models/current_model.dart';
import 'package:weather_app/src/features/weather/data/models/location_model.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_entity.dart';


///  Data model that extends the entity.
/// Used to convert from and to JSON for API and cache.
class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.location,
    required super.current,
    required super.cityName,
    required super.temperature,
    required super.condition,
    required super.iconUrl,
    super.isCached,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: LocationModel.fromJson(json['location']),
      current: CurrentModel.fromJson(json['current']),
      cityName: json['location']['name'],
      temperature: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      iconUrl: 'https:${json['current']['condition']['icon']}',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': (location as LocationModel).toJson(),
      'current': (current as CurrentModel).toJson(),
    };
  }
}
