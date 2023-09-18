import 'package:get/get.dart';
import 'package:mall/app/modules/splash/bindings/splash_binding.dart';
import 'package:mall/app/modules/splash/views/splash_view.dart';
import 'package:mall/app/modules/tabs/bindings/tabs_binding.dart';
import 'package:mall/app/modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.tabs,
      page: () => const TabsView(),
      binding: TabsBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    )
  ];
}