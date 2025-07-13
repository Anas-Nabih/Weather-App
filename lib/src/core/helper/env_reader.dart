import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Utility class for accessing environment variables

class EnvReader {
  static String get baseUrl {
    return dotenv.get("base_url");
  }

  static String get apiKey => dotenv.get("API_KEY");
}
