import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdmga_ecommerce/controllers/user_controller.dart';
import 'package:sdmga_ecommerce/models/user_info.dart';
import 'package:sdmga_ecommerce/pages/profile/profile_image.dart';
import 'package:sdmga_ecommerce/pages/profile/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: const [
          SizedBox(height: 20),
          ProfileImage(),
          SizedBox(height: 20),
          ProfileMenu(),
        ],
      ),
    );
  }
}
