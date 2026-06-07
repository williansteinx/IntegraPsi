import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class HttpService {
  final AuthService _authService = Get.find<AuthService>();

  Future<Map<String, String>> _headers({bool autenticado = true}) async {
    final headers = {'Content-Type': 'application/json'};
    if (autenticado) {
      final token = await _authService.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: await _headers(),
    );
    return _tratar(response);
  }

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body,
      {bool autenticado = true}) async {
    final response = await http.post(
      Uri.parse(url),
      headers: await _headers(autenticado: autenticado),
      body: jsonEncode(body),
    );
    return _tratar(response);
  }

  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> body) async {
    final response = await http.put(
      Uri.parse(url),
      headers: await _headers(),
      body: jsonEncode(body),
    );
    return _tratar(response);
  }

  Future<Map<String, dynamic>> delete(String url) async {
    final response = await http.delete(
      Uri.parse(url),
      headers: await _headers(),
    );
    return _tratar(response);
  }

  Map<String, dynamic> _tratar(http.Response response) {
    if (response.statusCode == 401) {
      _authService.logout();
      Get.offAllNamed('/');
      throw Exception('Sessão expirada. Faça login novamente.');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode >= 400) {
      throw Exception(body['mensagem'] ?? 'Erro na requisição.');
    }

    return body;
  }
}
