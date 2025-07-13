/// Represents the input parameters needed to fetch weather.

class WeatherParams {
  final String? city;

  WeatherParams({this.city});

  WeatherParams copyWith({String? city}) {
    return WeatherParams(city: city ?? this.city);
  }
}
