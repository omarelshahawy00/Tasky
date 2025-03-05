import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zbooma_to_do_app/core/cache/constants/cache_keys.dart';

class TokenStorage {
  static final TokenStorage _instance = TokenStorage._internal();
  factory TokenStorage() => _instance;
  TokenStorage._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> saveAccessToken(String token) async {
    try {
      await _secureStorage.write(key: CacheKeys.accessTokenKey, value: token);
    } catch (e) {
      throw Exception('Error saving access token: $e');
    }
  }

  Future<void> saveRefreshToken(String token) async {
    try {
      await _secureStorage.write(key: CacheKeys.refreshTokenKey, value: token);
    } catch (e) {
      throw Exception('Error saving refresh token: $e');
    }
  }

  Future<String?> getAccessToken() async {
    try {
      return await _secureStorage.read(key: CacheKeys.accessTokenKey);
    } catch (e) {
      throw Exception('Error retrieving access token: $e');
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      return await _secureStorage.read(key: CacheKeys.refreshTokenKey);
    } catch (e) {
      throw Exception('Error retrieving refresh token: $e');
    }
  }

  Future<void> deleteTokens() async {
    try {
      await _secureStorage.delete(key: CacheKeys.accessTokenKey);
      await _secureStorage.delete(key: CacheKeys.refreshTokenKey);
    } catch (e) {
      throw Exception('Error deleting tokens: $e');
    }
  }
}
