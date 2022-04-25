import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdmga_ecommerce/Utils/theme.dart';
import 'package:sdmga_ecommerce/controllers/bindings/auth_binding.dart';
import 'package:sdmga_ecommerce/controllers/bindings/home_binding.dart';
import 'package:sdmga_ecommerce/pages/admin_menu/add_category.dart';
import 'package:sdmga_ecommerce/pages/admin_menu/add_product.dart';
import 'package:sdmga_ecommerce/pages/home_page.dart';
import 'package:sdmga_ecommerce/pages/login/login_screen.dart';
import 'package:sdmga_ecommerce/pages/register/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SDMGA eCommerce',
      theme: myThemeData(),
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      initialRoute: HomePage.routeName,
      getPages: [
        GetPage(
          name: HomePage.routeName,
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
        GetPage(
          name: RegisterScreen.routeName,
          page: () => RegisterScreen(),
        ),
        GetPage(
          name: AddCategory.routeName,
          page: () => AddCategory(),
        ),
        GetPage(
          name: AddProduct.routeName,
          page: () => AddProduct(),
        ),
      ],
    );
  }
}
