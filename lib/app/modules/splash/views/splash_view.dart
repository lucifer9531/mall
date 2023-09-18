import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';
import 'package:mall/app/settings/app_colors.dart';
import 'package:mall/app/settings/app_screenAdapter.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Obx(() => controller.isShowGuide.value ? _guidePage() : _advertisingPage());
  }

  Widget _guidePage() {
    return SizedBox(
      width: AppScreenAdapter.screenW(),
      height: AppScreenAdapter.screenH(),
      child: Obx(
          () => Swiper(
            autoplay: false,
            loop: false,
            itemCount: controller.guideImgList.length,
            pagination: SwiperPagination(
              margin: const EdgeInsets.all(0.0),
              builder: SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: AppScreenAdapter.bottomH()),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: const RectSwiperPaginationBuilder(
                              color: AppColors.gray154,
                              activeColor: Colors.white,
                            ).build(context, config),
                          ),
                        )
                      ],
                    )
                  );
                }
              )
            ),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    controller.guideImgList[index],
                    fit: BoxFit.fill,
                  ),
                  index == controller.guideImgList.length - 1
                  ? Positioned(
                    left: (AppScreenAdapter.screenW() - AppScreenAdapter.w(170)) * 0.5,
                    right: (AppScreenAdapter.screenW() - AppScreenAdapter.w(170)) * 0.5,
                    bottom: AppScreenAdapter.adapterBottomH(),
                    height: AppScreenAdapter.h(35),
                    child: InkWell(
                      onTap: () {
                        controller.setLaunchedFlag("launched");
                        controller.jumpToMain();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(AppScreenAdapter.w(35)),
                        ),
                        child: Text(
                          "进入app",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppScreenAdapter.fs(14),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),
                  ) : const Positioned(
                    left: 0,
                    bottom: 0,
                    child: SizedBox(width: 0, height: 0),
                  )
                ],
              );
            },
          )
      ),
    );
  }

  Widget _advertisingPage() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/launch_02.png',
          fit: BoxFit.cover,
          width: AppScreenAdapter.screenW(),
          height: AppScreenAdapter.screenH(),
        ),
        Positioned(
          top: AppScreenAdapter.navH() + AppScreenAdapter.h(10),
          right: AppScreenAdapter.w(20),
          child: InkWell(
            onTap: () {
              controller.timer.cancel();
              controller.jumpToMain();
            },
            child: _skipButton(),
          ),
        ),
      ]
    );
  }

  Widget _skipButton() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppScreenAdapter.w(25)),
        ),
        width: AppScreenAdapter.w(50),
        height: AppScreenAdapter.w(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "跳过",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            Obx(
                  () => Text(
                "${controller.seconds.value}s",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: AppScreenAdapter.fs(15),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ));
  }
}
