import 'package:zbooma_to_do_app/core/cache/services/cache_helper.dart';

extension CacheHelperExtension on CacheHelper {
  Future<bool> saveString(String key, String value) => save<String>(key, value);
  Future<bool> saveInt(String key, int value) => save<int>(key, value);
  Future<bool> saveBool(String key, bool value) => save<bool>(key, value);
  Future<bool> saveDouble(String key, double value) => save<double>(key, value);

  String? getString(String key) => get<String>(key);
  int? getInt(String key) => get<int>(key);
  bool? getBool(String key) => get<bool>(key);
  double? getDouble(String key) => get<double>(key);
}
