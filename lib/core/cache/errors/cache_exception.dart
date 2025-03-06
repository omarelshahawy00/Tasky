class CacheException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  CacheException(this.message, {this.code, this.details});

  @override
  String toString() => 'CacheException(code: $code, message: $message)';
}
