import 'package:shared_preferences/shared_preferences.dart';

class DefaultSharedPreferences {
  final SharedPreferences _sharedPreferences;


  DefaultSharedPreferences(this._sharedPreferences);
  bool hasKey(String key) => _sharedPreferences.containsKey(key);

  Set<String> getKeys() => _sharedPreferences.getKeys();

  dynamic get(String key) => _sharedPreferences.get(key);

  Future<bool> remove(String key) => _sharedPreferences.remove(key);

  Future<bool> clear() => _sharedPreferences.clear();

  String getString(String key) => _sharedPreferences.getString(key);
  Future<bool> setString(String key, String value) => _sharedPreferences.setString(key, value);

  bool getBool(String key) => _sharedPreferences.getBool(key);
  Future<bool> setBool(String key, bool value) => _sharedPreferences.setBool(key, value);

  int getInt(String key) => _sharedPreferences.getInt(key);
  Future<bool> setInt(String key, int value) => _sharedPreferences.setInt(key, value);

  double getDouble(String key) => _sharedPreferences.getDouble(key);
  Future<bool> setDouble(String key, double value) => _sharedPreferences.setDouble(key, value);

  List<String> getStringList(String key) => _sharedPreferences.getStringList(key);
  Future<bool> setStringList(String key, List<String> value) => _sharedPreferences.setStringList(key, value);

}

