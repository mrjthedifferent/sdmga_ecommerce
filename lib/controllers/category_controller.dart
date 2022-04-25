import 'package:get/get.dart';
import 'package:sdmga_ecommerce/models/category.dart';
import 'package:sdmga_ecommerce/service/database.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();

  RxList<Category> categoryList = <Category>[
    Category(),
    Category(),
    Category(),
  ].obs;
  RxList<Category> specialCategoryList = <Category>[
    Category(),
    Category(),
    Category(),
  ].obs;

  List<Category> get getCategories => categoryList;
  List<Category> get getSpecialCategories => specialCategoryList;

  @override
  onReady() {
    Database().getCategories();
    Database().getSpecialCategories();
    super.onReady();
  }

  void setCategories(List<Category> categories) {
    categoryList.value = categories;
  }

  void setSpecialCategories(List<Category> categories) {
    specialCategoryList.value = categories;
  }
}
