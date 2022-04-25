import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sdmga_ecommerce/controllers/category_controller.dart';
import 'package:sdmga_ecommerce/models/category.dart';
import 'package:sdmga_ecommerce/models/product.dart';
import 'package:sdmga_ecommerce/service/database.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);
  static const String routeName = '/add-product';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  Product _product = Product();

  XFile? _imageFile;

  final List<Category> _categories = CategoryController.to.getCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              InkWell(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  // Pick an image
                  XFile? image = await _picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 50,
                  );
                  if (image != null) {
                    setState(() {
                      _imageFile = image;
                    });
                  }
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(20.0),
                    image: _imageFile != null
                        ? DecorationImage(
                            image: FileImage(File(_imageFile!.path)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _imageFile == null ? Icons.add_a_photo : Icons.image,
                        size: 50,
                      ),
                      Text(_imageFile == null ? 'Add Image' : 'Change Image'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //select category from dropdown
              DropdownButtonFormField(
                value: _product.category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                items: List.generate(_categories.length, (index) {
                  Category category = _categories[index];
                  return DropdownMenuItem(
                    value: category.getId(),
                    child: Text(category.getName()),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    _product.category = value.toString();
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildFormField(
                labelText: "Product Name",
                onChanged: (value) => _product.setName(value),
              ),
              const SizedBox(height: 20.0),
              _buildFormField(
                labelText: "Product Description",
                onChanged: (value) => _product.setDescription(value),
              ),
              const SizedBox(height: 20.0),
              _buildFormField(
                labelText: "Product Old Price",
                onChanged: (value) => _product.setOldPrice(value),
              ),
              const SizedBox(height: 20.0),
              _buildFormField(
                labelText: "Product Price",
                onChanged: (value) => _product.setPrice(value),
              ),
              const SizedBox(height: 20.0),
              _buildFormField(
                labelText: "Product Brand",
                onChanged: (value) => _product.setBrand(value),
              ),
              const SizedBox(height: 20.0),
              _buildFormField(
                labelText: "Product Quantity",
                onChanged: (value) => _product.setQuantity(value),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Database().uploadImage(
                      imageFile: _imageFile!,
                      imagePath: "product_image",
                      onSuccess: (imageUrl) {
                        _product.setImage(imageUrl);
                        Database().addProduct(product: _product);
                      },
                    );
                  }
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String labelText,
    required onChanged,
  }) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Enter $labelText',
        isDense: true,
        contentPadding: const EdgeInsets.all(16),
      ),
      onChanged: (value) => onChanged(value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
