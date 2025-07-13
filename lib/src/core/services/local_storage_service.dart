import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// An abstract interface for local storage operations.
/// This allows us to switch between different storage backends (e.g., SharedPreferences, Hive, etc.)
abstract class LocalStorageService {
  Future<void> setData(String key, dynamic value);

  Future<T?> getData<T>(String key);

  Future<void> removeData(String key);

  Future<void> clear();
}

@Named("shared_preferences")
@Injectable(as: LocalStorageService)
class SharedPreferencesService extends LocalStorageService {
  final SharedPreferences _service;

  SharedPreferencesService(this._service);

  @override
  Future<void> clear() {
    return _service.clear();
  }

  @override
  Future<T?> getData<T>(String key) async {
    final data = _service.getString(key);
    if (data != null) {
      if (T == String) {
        return data as T;
      } else {
        final decoded = jsonDecode(data);
        return decoded as T;
      }
    }
    return null;
  }

  @override
  Future<void> removeData(String key) {
    return _service.remove(key);
  }

  @override
  Future<void> setData(String key, value) {
    return _service.setString(key, value.toString());
  }
}
