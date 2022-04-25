import 'package:get/get.dart';
import 'package:sdmga_ecommerce/models/slider.dart';
import 'package:sdmga_ecommerce/service/database.dart';

class SliderController extends GetxController {
  static SliderController get to => Get.find();

  RxList<HomeSlider> sliderList = <HomeSlider>[
    HomeSlider(),
    HomeSlider(),
  ].obs;

  List<HomeSlider> get getSliderList => sliderList;

  @override
  void onReady() {
    Database().getSliders();
    super.onReady();
  }

  void setSliderList(List<HomeSlider> list) {
    sliderList.value = list;
  }
}
