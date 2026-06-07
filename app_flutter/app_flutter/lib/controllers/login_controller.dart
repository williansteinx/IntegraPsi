import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/services/auth_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPsicologo = true.obs;
  var estaCarregando = false.obs;

  final AuthService _authService = Get.find<AuthService>();

  void mudarPerfil(bool valor) {
    isPsicologo.value = valor;
  }

  Future<void> entrar() async {
    final email = emailController.text.trim();
    final senha = passwordController.text;

    if (email.isEmpty || senha.isEmpty) {
      Get.snackbar(
        'Atenção',
        'Preencha e-mail e senha.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    estaCarregando.value = true;

    try {
      await _authService.login(email, senha);
      Get.offAllNamed('/main');
    } catch (e) {
      Get.snackbar(
        'Erro',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      estaCarregando.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
