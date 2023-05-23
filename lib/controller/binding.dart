import 'package:get/get.dart';
import 'package:zym_attendance/controller/authController.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
