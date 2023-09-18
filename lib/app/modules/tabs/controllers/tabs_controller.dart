import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall/app/modules/category/views/category_view.dart';
import 'package:mall/app/modules/home/views/home_view.dart';
import 'package:mall/app/modules/me/views/me_view.dart';

class TabsController extends GetxController {

  RxInt currentIndex = 0.obs;

  PageController pageController = Get.arguments != null
      ? PageController(initialPage: Get.arguments["initialPage"])
      : PageController(initialPage: 0);

  final List<Widget> pages = [
    const HomeView(),
    const CategoryView(),
    const MeView(),
  ];

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      currentIndex.value = Get.arguments["initialPage"];
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
