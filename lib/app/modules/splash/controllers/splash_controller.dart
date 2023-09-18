import 'dart:async';

import 'package:get/get.dart';
import 'package:mall/app/settings/app_sharedPreferences.dart';

String FIRST_LAUNCH_KEY = "FirstLaunch";

class SplashController extends GetxController {

  late Timer timer;
  RxBool isShowGuide = false.obs;
  RxInt seconds = 5.obs;
  RxList guideImgList = [
    "assets/images/guide/guide_1.jpg",
    "assets/images/guide/guide_2.jpg",
    "assets/images/guide/guide_3.jpg",
    "assets/images/guide/guide_4.jpg"
  ].obs;

  @override
  void onInit() {
    super.onInit();
    judge();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void judge() async {
    String str = await getFirstLaunch();
    isShowGuide.value = str != "launched";
    if (!isShowGuide.value) {
      _initTimer();
    }
    update();
  }

  void _initTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds.value--;
      if (seconds.value <= 0) {
        timer.cancel();
        jumpToMain();
      }
      update();
    });
  }

  void jumpToMain() {
    Get.offAllNamed("/tabs");
  }

  void setLaunchedFlag(String launched) async {
    await setFirstLaunch(launched);
  }

  static setFirstLaunch(String launched) async {
    await AppSharedPreferences.setCache(FIRST_LAUNCH_KEY, launched);
  }

  static Future<String> getFirstLaunch() async {
    var data = await AppSharedPreferences.getCache(FIRST_LAUNCH_KEY);
    if (data != null && data != "") {
      return data;
    } else {
      return "";
    }
  }

  static removeFirstLaunch() async {
    await AppSharedPreferences.removeCache(FIRST_LAUNCH_KEY);
  }
}
