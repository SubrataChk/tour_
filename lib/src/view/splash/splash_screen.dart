import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:tour_application/src/app/app_image.dart';
import 'package:tour_application/src/routes/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  Future chooseScreen() async {
    var userId = box.read("uid");
    print(userId);

    if (userId == null) {
      Get.toNamed(onboarding);
    } else {
      Get.toNamed(bottomNav);
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () => chooseScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Image.asset(AppImage.appLogo)),
          Text(
            "Travel Agency",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          )
        ],
      )),
    );
  }
}
