import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static final SharedPreferencesUtil _instance =
      SharedPreferencesUtil._internal();
  static SharedPreferences? _prefs;

  factory SharedPreferencesUtil() {
    return _instance;
  }

  SharedPreferencesUtil._internal();

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String? getString(String key, {String? defaultValue}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static int? getInt(String key, {int? defaultValue}) {
    return _prefs?.getInt(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static bool? getBool(String key, {bool? defaultValue}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }
}
