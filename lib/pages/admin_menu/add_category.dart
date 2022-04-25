import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sdmga_ecommerce/models/category.dart';
import 'package:sdmga_ecommerce/models/product.dart';
import 'package:sdmga_ecommerce/service/database.dart';
import 'package:image_picker/image_picker.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);
  static const String routeName = '/add-category';

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formKey = GlobalKey<FormState>();

  Category _category = Category();

  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
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
              _buildFormField(
                labelText: "Category Name",
                onChanged: (value) => _category.setName(value),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Database().uploadImage(
                      imageFile: _imageFile!,
                      imagePath: "category_image",
                      onSuccess: (imageUrl) {
                        _category.setImageUrl(imageUrl);
                        Database().addCategory(category: _category);
                      },
                    );
                  }
                },
                child: Text('Add Category'),
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
