import 'package:get/get.dart';
import 'package:mall/app/modules/category/controllers/category_controller.dart';
import 'package:mall/app/modules/home/controllers/home_controller.dart';
import 'package:mall/app/modules/me/controllers/me_controller.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<MeController>(
      () => MeController(),
    );
  }
}
