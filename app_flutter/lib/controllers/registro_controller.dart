import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../core/api_config.dart';

class RegisterController extends GetxController {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final crpController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  final _estaCarregando = false.obs;
  bool get estaCarregando => _estaCarregando.value;

  String? validarConfirmacaoSenha(String? valor) {
    if (valor == null || valor.isEmpty) return 'Confirme a senha';
    if (valor != senhaController.text) return 'As senhas não coincidem';
    return null;
  }

  Future<void> cadastrarPsicologo() async {
    _estaCarregando.value = true;

    final Map<String, String> dadosFormulario = {
      "nome": nomeController.text.trim(),
      "email": emailController.text.trim(),
      "password": senhaController.text,
      "crp": crpController.text.trim(),
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(ApiConfig.usuarios),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dadosFormulario),
      );

      final Map<String, dynamic> respostaServidor = jsonDecode(response.body);

      if (response.statusCode == 201) {
        Get.snackbar(
          'Sucesso',
          respostaServidor['mensagem'] ?? 'Cadastro realizado com sucesso!',
          backgroundColor: const Color(0xFF4CAF50).withOpacity(0.9),
          colorText: const Color(0xFFFFFFFF),
        );
        Get.back();
      } else {
        Get.snackbar(
          'Aviso',
          respostaServidor['mensagem'] ?? 'Erro ao realizar cadastro.',
          backgroundColor: const Color(0xFFFFC107).withOpacity(0.9),
          colorText: const Color(0xFF000000),
        );
      }
    } catch (erro) {
      Get.snackbar(
        'Erro de conexão',
        'Não foi possível conectar ao servidor do IntegraPsi.',
        backgroundColor: const Color(0xFFF44336).withOpacity(0.9),
        colorText: const Color(0xFFFFFFFF),
      );
    } finally {
      _estaCarregando.value = false;
    }
  }

  @override
  void onClose() {
    nomeController.dispose();
    emailController.dispose();
    crpController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    super.onClose();
  }
}
