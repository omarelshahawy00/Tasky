class ApiConfig {
  static const String baseUrl = "https://todo.iraqsapp.com";
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
