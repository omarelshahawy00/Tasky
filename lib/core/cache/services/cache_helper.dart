import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zbooma_to_do_app/core/cache/errors/cache_exception.dart'
    show CacheException;
import 'package:zbooma_to_do_app/core/cache/interfaces/i_cache_service.dart';

class CacheHelper implements ICacheService {
  static final CacheHelper _instance = CacheHelper._internal();
  SharedPreferences? _prefs;
  bool _isInitialized = false;

  CacheHelper._internal();
  factory CacheHelper() => _instance;

  bool get isInitialized => _isInitialized;

  Future<void> init() async {
    if (_isInitialized) return;

    try {
      _prefs = await SharedPreferences.getInstance();
      _isInitialized = true;
    } catch (e) {
      throw CacheException(
        'Failed to initialize CacheHelper',
        code: 'INIT_ERROR',
        details: e,
      );
    }
  }

  void _checkInitialization() {
    if (!_isInitialized) {
      throw CacheException(
        'CacheHelper not initialized. Call init() first.',
        code: 'NOT_INITIALIZED',
      );
    }
  }

  @override
  Future<bool> save<T>(String key, T value) async {
    _checkInitialization();

    try {
      switch (T) {
        case String:
          return await _prefs!.setString(key, value as String);
        case int:
          return await _prefs!.setInt(key, value as int);
        case bool:
          return await _prefs!.setBool(key, value as bool);
        case double:
          return await _prefs!.setDouble(key, value as double);
        case const (List<String>):
          return await _prefs!.setStringList(key, value as List<String>);
        default:
          throw CacheException(
            'Unsupported type: ${T.toString()}',
            code: 'UNSUPPORTED_TYPE',
          );
      }
    } catch (e) {
      throw CacheException(
        'Failed to save data',
        code: 'SAVE_ERROR',
        details: e,
      );
    }
  }

  @override
  T? get<T>(String key) {
    _checkInitialization();

    try {
      final value = _prefs!.get(key);
      if (value != null && value is T) {
        return value as T;
      }
      return null;
    } catch (e) {
      throw CacheException(
        'Failed to retrieve data',
        code: 'RETRIEVE_ERROR',
        details: e,
      );
    }
  }

  @override
  Future<bool> saveObject<T>(String key, T value) async {
    _checkInitialization();

    try {
      final jsonString = json.encode((value as dynamic).toJson());
      return await _prefs!.setString(key, jsonString);
    } catch (e) {
      throw CacheException(
        'Failed to save object',
        code: 'SAVE_OBJECT_ERROR',
        details: e,
      );
    }
  }

  @override
  T? getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    _checkInitialization();

    try {
      final jsonString = _prefs!.getString(key);
      if (jsonString != null) {
        final map = json.decode(jsonString) as Map<String, dynamic>;
        return fromJson(map);
      }
      return null;
    } catch (e) {
      throw CacheException(
        'Failed to retrieve object',
        code: 'RETRIEVE_OBJECT_ERROR',
        details: e,
      );
    }
  }

  @override
  Future<bool> saveList<T>(String key, List<T> items) async {
    _checkInitialization();

    try {
      final jsonString = json.encode(
        items.map((item) => (item as dynamic).toJson()).toList(),
      );
      return await _prefs!.setString(key, jsonString);
    } catch (e) {
      throw CacheException(
        'Failed to save list',
        code: 'SAVE_LIST_ERROR',
        details: e,
      );
    }
  }

  @override
  List<T>? getList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    _checkInitialization();

    try {
      final jsonString = _prefs!.getString(key);
      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        return jsonList
            .map((item) => fromJson(item as Map<String, dynamic>))
            .toList();
      }
      return null;
    } catch (e) {
      throw CacheException(
        'Failed to retrieve list',
        code: 'RETRIEVE_LIST_ERROR',
        details: e,
      );
    }
  }

  @override
  Future<bool> remove(String key) async {
    _checkInitialization();

    try {
      return await _prefs!.remove(key);
    } catch (e) {
      throw CacheException(
        'Failed to remove data',
        code: 'REMOVE_ERROR',
        details: e,
      );
    }
  }

  @override
  Future<bool> clear() async {
    _checkInitialization();

    try {
      return await _prefs!.clear();
    } catch (e) {
      throw CacheException(
        'Failed to clear cache',
        code: 'CLEAR_ERROR',
        details: e,
      );
    }
  }

  @override
  bool hasKey(String key) {
    _checkInitialization();
    return _prefs!.containsKey(key);
  }
}
