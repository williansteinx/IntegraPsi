import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../models/usuario_model.dart';
import '../../core/api_config.dart';

class AuthService {
  static const _keyToken   = 'jwt_token';
  static const _keyUsuario = 'usuario_logado';

  final _storage = const FlutterSecureStorage();

  Future<Usuario> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConfig.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final body = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200 || body['sucesso'] != true) {
      throw Exception(body['mensagem'] ?? 'Erro ao realizar login.');
    }

    final usuario = Usuario.fromJson(body['dados']);

    await _storage.write(key: _keyToken,   value: usuario.token);
    await _storage.write(key: _keyUsuario, value: jsonEncode(body['dados']));

    return usuario;
  }

  Future<void> logout() async {
    await _storage.delete(key: _keyToken);
    await _storage.delete(key: _keyUsuario);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  Future<Usuario?> getUsuarioLogado() async {
    final json = await _storage.read(key: _keyUsuario);
    if (json == null) return null;
    return Usuario.fromJson(jsonDecode(json));
  }

  Future<bool> estaLogado() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
