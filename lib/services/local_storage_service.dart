import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  SharedPreferences? _storage;

  bool get storageAvailable => _storage != null;

  Future<void> loadStorage() async {
    _storage = await SharedPreferences.getInstance();
  }

  Future<void> setItem(String key, dynamic value) async {
    final type = value.runtimeType;

    switch (type) {
      case int:
        await _storage!.setInt(key, value);
        break;
      case double:
        await _storage!.setDouble(key, value);
        break;
      case bool:
        await _storage!.setBool(key, value);
        break;
      case String:
        await _storage!.setString(key, value);
        break;
      case const (List<String>):
        await _storage!.setStringList(key, value);
        break;
      default:
        await _storage!.setString(key, json.encode(value));
    }
  }

  dynamic getItem(String key) {
    return _storage!.get(key);
  }

  Future<void> removeItem(String key) async {
    await _storage!.remove(key);
  }

  bool hasItem(String key) {
    return _storage!.containsKey(key);
  }
}
