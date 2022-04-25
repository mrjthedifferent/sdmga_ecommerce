import 'package:get/get.dart';
import 'package:sdmga_ecommerce/controllers/category_controller.dart';
import 'package:sdmga_ecommerce/controllers/menu_controller.dart';
import 'package:sdmga_ecommerce/controllers/product_controller.dart';
import 'package:sdmga_ecommerce/controllers/slider_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuController>(MenuController(), permanent: true);
    Get.lazyPut(() => SliderController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => ProductController());
  }
}
