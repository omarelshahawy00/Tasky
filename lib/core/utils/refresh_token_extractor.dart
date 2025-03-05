class TokenExtractor {
  String? extractRefreshToken(Map<String, dynamic>? headers) {
    if (headers == null) return null;

    final cookies = headers['set-cookie'] as List<dynamic>?;
    if (cookies != null) {
      for (String cookie in cookies) {
        if (cookie.contains('refreshToken=')) {
          return cookie.split('refreshToken=')[1].split(';')[0];
        }
      }
    }
    return null;
  }
}
