import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPsicologo = true.obs;

  void mudarPerfil(bool valor) {
    isPsicologo.value = valor;
  }
}
