import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sdmga_ecommerce/controllers/slider_controller.dart';

import '../../models/slider.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<HomeSlider> sliderList = SliderController.to.getSliderList;
      return CarouselSlider.builder(
        itemCount: sliderList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          HomeSlider slider = sliderList[itemIndex];
          return _buildSlider(slider);
        },
        options: _carouselOptions(),
      );
    });
  }

  Widget _buildSlider(HomeSlider slider) {
    return Container(
      decoration: slider.imageUrl == null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(slider.imageUrl ?? ""),
                fit: BoxFit.cover,
              ),
            ),
      child: slider.imageUrl == null ? _loading() : null,
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  CarouselOptions _carouselOptions() {
    return CarouselOptions(
      aspectRatio: 16 / 6,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      scrollDirection: Axis.horizontal,
    );
  }
}
