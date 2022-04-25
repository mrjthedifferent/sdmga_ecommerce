import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdmga_ecommerce/controllers/category_controller.dart';
import '../../models/category.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        List<Category> categories = CategoryController.to.getCategories;
        return GridView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 0.8 ,
          ),
          itemBuilder: (context, index) {
            Category category = categories[index];
            return _generateCategory(category);
          },
        );
      },
    );
  }

  Widget _generateCategory(Category category) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.network(
            category.imageUrl ?? "",
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Expanded(
          child: Text(
            category.name ?? "dfgdfg",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.grey,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}
