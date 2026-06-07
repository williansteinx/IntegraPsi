import 'package:get/get.dart';
import '../controllers/registro_controller.dart';

class RegistroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
