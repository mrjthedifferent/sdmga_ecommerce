import 'package:flutter/material.dart';
import 'package:sdmga_ecommerce/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:sdmga_ecommerce/pages/admin_menu/add_category.dart';
import 'package:sdmga_ecommerce/pages/admin_menu/add_product.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenu(
          title: "My Account",
          icon: Icons.account_box_outlined,
          onTap: () {},
        ),
        _buildMenu(
          title: "Notifications",
          icon: Icons.notifications_outlined,
          onTap: () {},
        ),
        _buildMenu(
          title: "Settings",
          icon: Icons.settings_outlined,
          onTap: () {},
        ),
        _buildMenu(
          title: "Log out",
          icon: Icons.logout_outlined,
          onTap: () {
            AuthController.to.logOut();
          },
        ),
        _buildMenu(
          title: "Add Category",
          icon: Icons.approval,
          onTap: () {
            Get.toNamed(AddCategory.routeName);
          },
        ),
        _buildMenu(
          title: "Add Product",
          icon: Icons.approval,
          onTap: () {
            Get.toNamed(AddProduct.routeName);
          },
        ),
      ],
    );
  }

  Widget _buildMenu(
      {required String title,
      required IconData icon,
      required Function onTap}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () => onTap(),
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
