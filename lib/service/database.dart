import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdmga_ecommerce/controllers/category_controller.dart';
import 'package:sdmga_ecommerce/controllers/product_controller.dart';
import 'package:sdmga_ecommerce/controllers/slider_controller.dart';
import 'package:sdmga_ecommerce/models/category.dart';
import 'package:sdmga_ecommerce/models/slider.dart';

import '../controllers/user_controller.dart';
import '../models/product.dart';
import '../models/user_info.dart';
import 'package:get/get.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final database = FirebaseDatabase.instance;

class Database {
  Future<User?> register(String email, String password) async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    if (user != null) {
      UserDetails userDetails = UserDetails(
        userId: user.uid,
        userEmail: email,
      );
      saveUser(userDetails);
    }

    return user;
  }

  void saveUser(UserDetails user) {
    final database = FirebaseDatabase.instance;
    database.ref('users').child(user.userId).set(user.toJson());
    //save user to database
  }

  Future<User?> login(String email, String password) async {
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    return user;
  }

  Future<void> logout() async {
    return _auth.signOut();
  }

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> updateUser(UserDetails user) async {
    final database = FirebaseDatabase.instance;
    database.ref('users').child(user.userId).update(user.toJson());
  }

  Future<void> deleteUser(UserDetails user) async {
    database.ref('users').child(user.userId).remove();
  }

  void getSliders() {
    DatabaseReference ref = database.ref("sliders");
    ref.onValue.listen((event) {
      List<HomeSlider> homeSliderList = [];
      Map<dynamic, dynamic> values =
          event.snapshot.value as Map<dynamic, dynamic>;
      values.forEach(
        (key, values) {
          homeSliderList.add(HomeSlider.fromJson(values));
        },
      );

      SliderController.to.setSliderList(homeSliderList);
    });
  }

  void getCategories() {
    DatabaseReference ref = database.ref("categories");
    ref.onValue.listen((event) {
      print(event.snapshot.value);
      List<Category> categoryList = [];
      Map<dynamic, dynamic> values =
          event.snapshot.value as Map<dynamic, dynamic>;
      values.forEach(
        (key, values) {
          categoryList.add(Category.fromJson(values));
        },
      );
      CategoryController.to.setCategories(categoryList);
    });
  }

    void getProducts() {
    DatabaseReference ref = database.ref("products");
    ref.onValue.listen((event) {
      print(event.snapshot.value);
      List<Product> productList = [];
      Map<dynamic, dynamic> values =
          event.snapshot.value as Map<dynamic, dynamic>;
      values.forEach(
        (key, values) {
          productList.add(Product.fromJson(values));
        },
      );
      ProductController.to.setProductList(productList);
    });
  }
    void getFavoriteProducts() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = database.ref("favorites").child(uid);
    ref.onValue.listen((event) {
      print(event.snapshot.value);
      List<Product> productList = [];
      Map<dynamic, dynamic> values =
          event.snapshot.value as Map<dynamic, dynamic>;
      values.forEach(
        (key, values) {
          productList.add(Product.fromJson(values));
        },
      );
      ProductController.to.setFavProductList(productList);
    });
  }

  void removeFavProduct(String productId){
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = database.ref("favorites").child(uid);
    ref.child(productId).remove();
  }

  void getSpecialCategories() {
    DatabaseReference ref = database.ref("specialCategory");
    ref.onValue.listen((event) {
      print(event.snapshot.value);
      List<Category> categoryList = [];
      Map<dynamic, dynamic> values =
          event.snapshot.value as Map<dynamic, dynamic>;
      values.forEach(
        (key, values) {
          categoryList.add(Category.fromJson(values));
        },
      );
      CategoryController.to.setSpecialCategories(categoryList);
    });
  }

  void getUser(String userId) {
    UserDetails userDetails;

    if (userId.isNotEmpty) {
      DatabaseReference ref = database.ref('users').child(userId);
      ref.onValue.listen((event) => {
            userDetails = UserDetails.fromJson(
                event.snapshot.value as Map<dynamic, dynamic>),
            print(userDetails.userEmail),
            UserController.to.setUserDetails(userDetails)
          });
    }
  }

  void addProduct({required Product product}) {
    DatabaseReference ref = database.ref("products");
    String? productId = ref.push().key;
    product.setId(productId!);
    ref.child(productId).set(product.toJson());
  }

  void addCategory({required Category category}) {
    DatabaseReference ref = database.ref("categories");
    String? categoryId = ref.push().key;
    category.setId(categoryId!);
    ref.child(categoryId).set(category.toJson());
  }

  Future<void> uploadImage({
    required XFile imageFile,
    required Function onSuccess,
    required imagePath,
  }) async {
    Get.defaultDialog(
      title: 'Uploading Image',
      content: const SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage
        .ref()
        .child("$imagePath/${DateTime.now().millisecondsSinceEpoch}");
    print(ref);
    UploadTask uploadTask = ref.putFile(File(imageFile.path));
    uploadTask.then((res) {
      Get.back();
      res.ref.getDownloadURL().then((url) {
        onSuccess(url);
      });
    });
  }

  void addFavorite({required Product product}) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = database.ref("favorites");
    ref.child(uid).child(product.getId).set(product.toJson());
  }
}
