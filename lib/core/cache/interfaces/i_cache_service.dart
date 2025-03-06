abstract class ICacheService {
  Future<bool> save<T>(String key, T value);
  T? get<T>(String key);
  Future<bool> saveObject<T>(String key, T value);
  T? getObject<T>(String key, T Function(Map<String, dynamic>) fromJson);
  Future<bool> saveList<T>(String key, List<T> items);
  List<T>? getList<T>(String key, T Function(Map<String, dynamic>) fromJson);
  Future<bool> remove(String key);
  Future<bool> clear();
  bool hasKey(String key);
}
