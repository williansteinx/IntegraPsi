import 'package:get/get.dart';
import '../data/models/appointment_model.dart';
import '../data/services/auth_service.dart';

class DashboardController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  var appointments = <Appointment>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAppointments();
  }

  void loadAppointments() async {
    isLoading.value = true;
    appointments.value = [];
    isLoading.value = false;
  }

  void logout() {
    _authService.logout();
    Get.offAllNamed('/');
  }
}
