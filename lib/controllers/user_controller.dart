
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sdmga_ecommerce/service/database.dart';

import '../models/user_info.dart';
import 'auth_controller.dart';

class UserController extends GetxController{
  static UserController get to => Get.find();
  Rx<UserDetails> userDetails = UserDetails(userId: '').obs;

  @override
  void onReady() {
    String userId = AuthController.to.getUserId;
    if(userId.isNotEmpty){
      Database().getUser(userId);
    }
    super.onReady();
  }

  UserDetails get getUserDetails => userDetails.value;

  void setUserDetails(UserDetails userDetails){
    this.userDetails.value = userDetails;
  }
}