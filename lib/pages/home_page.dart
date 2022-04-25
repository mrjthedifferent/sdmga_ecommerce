import 'package:flutter/material.dart';
import 'package:sdmga_ecommerce/controllers/auth_controller.dart';
import 'package:sdmga_ecommerce/pages/favorite/favorite_products.dart';
import 'package:sdmga_ecommerce/pages/home/home_screen.dart';
import 'package:sdmga_ecommerce/pages/login/login_screen.dart';
import 'package:sdmga_ecommerce/pages/profile/profile_screen.dart';

import '../Utils/enums.dart';
import '../controllers/menu_controller.dart';
import 'components/bottom_nav_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      body: Obx(
        () {
          MenuState currentState = MenuController.to.currentState;
          if (currentState == MenuState.home) {
            return HomeScreen();
          }
          if (currentState == MenuState.favourite) {
            return FavoriteProducts();
          }
          return _getPage(currentState);
        },
      ),
    );
  }

  Widget _getPage(MenuState currentState){
    if(AuthController.to.isLoggedInValue){
      if (currentState == MenuState.profile) {
        return const ProfileScreen();
      }
    }
    return const LoginScreen();
  }
}
