

import 'package:get/get.dart';
import 'package:sdmga_ecommerce/models/product.dart';

import '../service/database.dart';

class ProductController extends GetxController{
  static ProductController get to => Get.find();
  final Database _db = Database();

  RxList<Product> productList = <Product>[
    Product(),
    Product(),
  ].obs;
  RxList<Product> favProductList = <Product>[
    Product(),
    Product(),
  ].obs;

  List<Product> get getProductList => productList;
  List<Product> get getFavProductList => favProductList;

  @override
  void onReady() {
    _db.getProducts();
    _db.getFavoriteProducts();
    super.onReady();
  }

  void setProductList(List<Product> list) {
    productList.value = list;
  }

  bool ifFavProduct(String productId){
    return favProductList.value.any((element) => element.id == productId);
  }

  void setFavProductList(List<Product> list) {
    favProductList.value = list;
  }

  void removeFavProduct(String productId){
    _db.removeFavProduct(productId);
  }
}