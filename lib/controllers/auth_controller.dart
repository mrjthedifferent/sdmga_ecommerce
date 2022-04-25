import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sdmga_ecommerce/Utils/enums.dart';
import 'package:sdmga_ecommerce/controllers/menu_controller.dart';
import 'package:sdmga_ecommerce/controllers/user_controller.dart';
import 'package:sdmga_ecommerce/pages/home_page.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoggedIn = false.obs;
  late Rx<User?> firebaseUser;

  String get getUserId {
    return firebaseUser.value?.uid ?? "";
  }

  bool get isLoggedInValue {
    return isLoggedIn.value;
  }

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);

    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, handleUser);
  }

  void handleUser(User? user) {
    if (user != null) {
      isLoggedIn.value = true;
      Get.put(UserController(), permanent: true);
    }
  }

  void logOut() {
    _auth.signOut();
    isLoggedIn.value = false;
    Get.offAllNamed(HomePage.routeName);
  }
  
}
