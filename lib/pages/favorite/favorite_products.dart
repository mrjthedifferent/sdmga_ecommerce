import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdmga_ecommerce/controllers/product_controller.dart';

import '../../models/product.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products'),
      ),
      body: Obx(() {
        List<Product> favoriteProducts = ProductController.to.getFavProductList;
        return ListView.builder(
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            Product product = favoriteProducts[index];
            return ListTile(
              leading: Image.network(product.getImage),
              title: Text(
                product.getName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(favoriteProducts[index].getPrice.toString()),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  ProductController.to.removeFavProduct(product.getId);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
