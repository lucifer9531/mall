import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreenAdapter {
  static w(num value) {
    return value.w;
  }

  static h(num value) {
    return value.h;
  }

  static r(num value) {
    return value.r;
  }

  static fs(num value) {
    return value.sp;
  }

  static screenW() {
    return ScreenUtil().screenWidth;
  }

  static screenH() {
    return ScreenUtil().screenHeight;
  }

  static statusH() {
    return ScreenUtil().statusBarHeight;
  }

  static navH() {
    return 44.h;
  }

  static tabBarH() {
    return 49.h;
  }

  static bottomH() {
    return ScreenUtil().bottomBarHeight != 0.0
        ? ScreenUtil().bottomBarHeight
        : 34.0;
  }

  static adapterBottomH() {
    return tabBarH() + bottomH();
  }
}
