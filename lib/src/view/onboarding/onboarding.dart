import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:tour_application/src/app/app_color.dart';
import 'package:tour_application/src/app/app_image.dart';
import 'package:tour_application/src/routes/route.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  final List<String> _slider = [
    AppImage.slideOne,
    AppImage.slideTwo,
    AppImage.sliderThree,
  ];

  final List<String> _title = [
    "Welcome",
    "Categories",
    "Support",
  ];

  final List<String> _des = [
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum",
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum",
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum",
  ];

  RxInt currentIndex = 0.obs;

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Obx(() => Expanded(
                flex: 2, child: Lottie.asset(_slider[currentIndex.toInt()]))),
            Obx(
              (() => Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.scaffoldBackground,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 10,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 5,
                              spreadRadius: 1.0)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 2.w),
                          child: Text(
                            _title[currentIndex.toInt()],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            _des[currentIndex.toInt()],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DotsIndicator(
                                dotsCount: _slider.length,
                                position: currentIndex.toDouble(),
                                decorator: const DotsDecorator(),
                              ),
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: const BoxDecoration(
                                    color: AppColors.scaffoldBackground,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(4.0, 4.0),
                                          blurRadius: 10,
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4.0, -4.0),
                                          blurRadius: 5,
                                          spreadRadius: 1.0)
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      // ignore: unrelated_type_equality_checks
                                      if (currentIndex == _title.length - 1) {
                                        Get.toNamed(signup);
                                      } else {
                                        currentIndex++;
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20.h,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
            ),
          ],
        ),
      ),
    ));
  }
}
