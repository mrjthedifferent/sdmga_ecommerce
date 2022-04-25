import 'package:get/get.dart';

import '../Utils/enums.dart';

class MenuController extends GetxController {
  static MenuController get to => Get.find();
  final Rx<MenuState> currentMenuState = MenuState.home.obs;

  MenuState get currentState => currentMenuState.value;

  void changeMenuState(MenuState menuState) {
    currentMenuState.value = menuState;
  }
}

