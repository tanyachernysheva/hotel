import 'dart:convert';

import 'package:http/http.dart' as http;

final class HttpClient {
  HttpClient._();

  static HttpClient? _apiClient;

  factory HttpClient() {
    return _apiClient ??= HttpClient._();
  }

  Future<dynamic> get(String path) async {
    final Uri uri = Uri.parse(path);

    final response = await http.get(uri);

    return jsonDecode(response.body);
  }
}
