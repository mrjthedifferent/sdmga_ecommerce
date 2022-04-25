
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controllers/category_controller.dart';
import '../../models/category.dart';

class SpecialCategory extends StatelessWidget {
  const SpecialCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        List<Category> categories = CategoryController.to.getSpecialCategories;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(categories.length, (index) {
              Category category = categories[index];
              return _generateSpecialCategory(category);
            }),
          ),
        );
      },
    );
  }

  Widget _generateSpecialCategory(Category category){
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 250,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
          image: NetworkImage(category.imageUrl ?? ""),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "No data",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
