import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/routes/app_pages.dart';
import 'app/settings/app_colors.dart';

void main() {
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  runApp(
    ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: "熟客来采",
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.grey),
            themeMode: ThemeMode.system,
            onInit: () {
              print("init completed");
            },
            defaultTransition: Transition.rightToLeft,
            builder: EasyLoading.init(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        }),
  );

  FlutterNativeSplash.remove();

  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..animationDuration = const Duration(milliseconds: 100)
    ..loadingStyle = EasyLoadingStyle.custom
    ..displayDuration = const Duration(milliseconds: 1000)

    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.black128
    ..indicatorColor = Colors.white
    ..progressColor = Colors.white
    ..textColor = Colors.white
    ..fontSize = 12
    ..radius = 5.0

    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorSize = 45.0

    ..textPadding = const EdgeInsets.only(top: 10)
    ..successWidget =
    const Icon(Icons.check_outlined, size: 20, color: Colors.white)
    ..errorWidget = const Icon(Icons.close, size: 20, color: Colors.white)

    ..maskType = EasyLoadingMaskType.none
    ..userInteractions = false

    ..dismissOnTap = true;
}
