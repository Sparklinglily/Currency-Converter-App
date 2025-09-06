class ApiConstants {
  static const String baseUrl = 'https://v6.exchangerate-api.com/v6';
  static const String apiKey = '3f58bd25a13a348407e478ca';

  static String get codesEndpoint => '$baseUrl/$apiKey/codes';
  static String pairEndpoint(String from, String to) =>
      '$baseUrl/$apiKey/pair/$from/$to';
}
