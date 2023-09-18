import 'package:flutter/material.dart';
import 'package:mall/app/settings/app_colors.dart';
import 'package:mall/app/settings/app_screenAdapter.dart';

Widget commonEmptyView(String title) {
  return SizedBox(
    width: double.infinity,
    height: AppScreenAdapter.h(250),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/empty.png",
          width: AppScreenAdapter.w(100),
          height: AppScreenAdapter.h(100),
          fit: BoxFit.fill,
        ),
        SizedBox(height: AppScreenAdapter.h(10)),
        Text(
          title,
          style: TextStyle(
            color: AppColors.gray154,
            fontSize: AppScreenAdapter.fs(14),
          ),
        )
      ],
    )
  );
}