import 'package:get/get.dart';
import '../data/models/appointment_model.dart';

class AgendaController extends GetxController {
  var appointments = <Appointment>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAppointments();
  }

  void loadAppointments() async {
    isLoading.value = true;
    // Carregar da API ou DB
    await Future.delayed(const Duration(seconds: 1));
    appointments.value = [
      // Exemplo
    ];
    isLoading.value = false;
  }
}
