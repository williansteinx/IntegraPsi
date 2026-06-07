import 'package:get/get.dart';
import '../data/models/appointment_model.dart';
import '../data/services/auth_service.dart';

class DashboardController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  var appointments   = <Appointment>[].obs;
  var isLoading      = false.obs;
  var nomePsicologo  = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _carregarUsuario();
  }

  Future<void> _carregarUsuario() async {
    final usuario = await _authService.getUsuarioLogado();
    if (usuario != null) {
      nomePsicologo.value = usuario.nmPsicologo;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    Get.offAllNamed('/');
  }
}
