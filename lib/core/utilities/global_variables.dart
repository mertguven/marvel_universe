class GlobalVariables {
  static const String _baseUrl =
      "https://gateway.marvel.com/v1/public/characters";

  static String url(String route) {
    return "$_baseUrl$route";
  }
}
