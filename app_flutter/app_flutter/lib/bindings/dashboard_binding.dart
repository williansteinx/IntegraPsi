import 'package:get/get.dart';
import '../data/services/auth_service.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
