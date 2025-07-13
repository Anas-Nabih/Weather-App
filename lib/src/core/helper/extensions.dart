 import 'package:intl/intl.dart';
import 'package:weather_app/src/core/helper/strings_enum.dart';

extension StringExtension on String {
  /// convert icon resolution from 64x64 to 128x128
  String toHighRes() {
    return replaceFirst('64x64', '128x128');
  }

  /// add http: before the icon link
  String addHttpPrefix() {
    return 'https:$this';
  }

  /// convert wind direction from letters to words => N = North
  String getWindDir() {
    switch (this) {
      case 'N':
        return Strings.north;
      case 'S':
        return Strings.south;
      case 'E':
        return Strings.east;
      case 'W':
        return Strings.west;
      case 'NE':
      case 'NNE':
      case 'ENE':
        return Strings.northeast;
      case 'SE':
      case 'ESE':
      case 'SSE':
        return Strings.southeast;
      case 'SW':
      case 'SSW':
      case 'WSW':
        return Strings.southwest;
      case 'NW':
      case 'WNW':
      case 'NNW':
        return Strings.northwest;
      default:
        return this;
    }
  }

  /// convert the date to time => 2023-09-24 01:00 = 01:00
  String convertToTime() {
    var dateTime = DateTime.parse(this);
    if (dateTime.hour == DateTime.now().hour) return Strings.now;
    return DateFormat('HH:mm').format(dateTime);
  }

  /// format the time => 01:00 AM = 01:00
  String formatTime() {
    var dateTime = DateFormat("hh:mm a").parse(this);
    return DateFormat("hh:mm").format(dateTime);
  }
}
