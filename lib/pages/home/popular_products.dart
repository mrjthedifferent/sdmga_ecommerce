import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdmga_ecommerce/pages/home/popular_product_view.dart';
import 'package:sdmga_ecommerce/service/database.dart';

import '../../controllers/product_controller.dart';
import '../../models/product.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Product> products = ProductController.to.getProductList;
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          Product product = products[index];
          return PopularProductView(product: product);
        },
      );
    });
  }
}
