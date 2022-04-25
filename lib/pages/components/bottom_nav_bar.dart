import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdmga_ecommerce/Utils/enums.dart';
import 'package:sdmga_ecommerce/controllers/menu_controller.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        MenuState currentMenuState = MenuController.to.currentState;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMenuBarItem(
              icon: Icons.home,
              state: MenuState.home,
              currentState: currentMenuState,
            ),
            _buildMenuBarItem(
              icon: Icons.favorite,
              state: MenuState.favourite,
              currentState: currentMenuState,
            ),
            _buildMenuBarItem(
              icon: Icons.message,
              state: MenuState.message,
              currentState: currentMenuState,
            ),
            _buildMenuBarItem(
              icon: Icons.person,
              state: MenuState.profile,
              currentState: currentMenuState,
            ),
          ],
        );
      }),
    );
  }

  Widget _buildMenuBarItem({
    required IconData icon,
    required MenuState state,
    required MenuState currentState,
  }) {
    return IconButton(
      onPressed: () {
        MenuController.to.changeMenuState(state);
      },
      icon: Icon(
        icon,
        color: state == currentState ? Colors.black : Colors.grey,
      ),
    );
  }
}
