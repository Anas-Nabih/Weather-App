class LocationEntity {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String timeZoneId;
  final int localtimeEpoch;
  final String localtime;

  const LocationEntity({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.timeZoneId,
    required this.localtimeEpoch,
    required this.localtime,
  });
}