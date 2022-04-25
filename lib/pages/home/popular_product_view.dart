

import 'package:flutter/material.dart';
import 'package:sdmga_ecommerce/models/product.dart';

import '../../controllers/product_controller.dart';
import '../../service/database.dart';

class PopularProductView extends StatefulWidget {
  final Product product;
  const PopularProductView({Key? key, required this.product}) : super(key: key);

  @override
  _PopularProductViewState createState() => _PopularProductViewState();
}

class _PopularProductViewState extends State<PopularProductView> {

  bool? isFavourite;

  @override
  Widget build(BuildContext context) {
    isFavourite ??= ProductController.to.ifFavProduct(widget.product.getId);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            widget.product.image!,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.getName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '\$${widget.product.getPrice}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '\$${widget.product.getPrice}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  if(isFavourite == true) {
                    setState(() {
                      isFavourite = false;
                      ProductController.to.removeFavProduct(widget.product.getId);
                    });
                  }else{
                    setState(() {
                      isFavourite = true;
                      Database().addFavorite(product: widget.product);
                    });
                  }
                },
                icon: isFavourite == true
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: Colors.red,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
