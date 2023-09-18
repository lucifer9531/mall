import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mall/app/settings/app_colors.dart';
import 'package:mall/app/settings/app_fontIcons.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Scaffold(
          body: PageView(
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (value) {
              controller.setCurrentIndex(value);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.theme,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.setCurrentIndex(value);
              controller.pageController.jumpToPage(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  AppFontIcons.homeNormal,
                  color: AppColors.black51,
                ),
                activeIcon: Icon(AppFontIcons.homeSelected),
                label: "首页",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    AppFontIcons.categoryNormal,
                    color: AppColors.black51,
                  ),
                  activeIcon: Icon(AppFontIcons.categorySelected),
                  label: "分类"
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    AppFontIcons.meNormal,
                    color: AppColors.black51,
                  ),
                  activeIcon: Icon(AppFontIcons.meSelected),
                  label: "我的")
            ],
          ),
        )
    );
  }
}
