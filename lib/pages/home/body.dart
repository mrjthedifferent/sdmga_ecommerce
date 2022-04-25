import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sdmga_ecommerce/pages/home/popular_products.dart';
import 'package:sdmga_ecommerce/pages/home/slider.dart';
import 'package:sdmga_ecommerce/pages/home/special_category.dart';

import 'category.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        const SliderWidget(),
        const SizedBox(height: 20.0),
        const CategoryView(),
        const SizedBox(height: 20.0),
        _generateSpecialCatLabel(),
        const SizedBox(height: 10.0),
        const SpecialCategory(),
        const SizedBox(height: 20.0),
        _generateProducLabel(),
        const SizedBox(height: 10.0),
        const PopularProducts(),
      ],
    );
  }

  Widget _generateSpecialCatLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Special For You",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("See more"),
      ],
    );
  }
  Widget _generateProducLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Popular Products",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("See more"),
      ],
    );
  }
}
