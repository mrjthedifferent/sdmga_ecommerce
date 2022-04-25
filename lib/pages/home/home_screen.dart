import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdmga_ecommerce/Utils/enums.dart';
import 'package:sdmga_ecommerce/controllers/menu_controller.dart';
import 'package:sdmga_ecommerce/pages/components/bottom_nav_bar.dart';
import 'package:sdmga_ecommerce/pages/profile/profile_screen.dart';
import 'appbar.dart';
import 'body.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const HomeBody(),
    );
  }
}
