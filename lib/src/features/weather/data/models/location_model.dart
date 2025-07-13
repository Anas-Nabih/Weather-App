import 'package:weather_app/src/features/weather/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.name,
    required super.region,
    required super.country,
    required super.lat,
    required super.lon,
    required super.timeZoneId,
    required super.localtimeEpoch,
    required super.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      timeZoneId: json['tz_id'],
      localtimeEpoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tz_id': timeZoneId,
      'localtime_epoch': localtimeEpoch,
      'localtime': localtime,
    };
  }
}
