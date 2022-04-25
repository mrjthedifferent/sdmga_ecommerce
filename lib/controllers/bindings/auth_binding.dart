

import 'package:get/get.dart';
import 'package:sdmga_ecommerce/controllers/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}