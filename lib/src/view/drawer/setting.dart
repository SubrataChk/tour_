import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_application/src/global/theme/theme.dart';

import '../../routes/route.dart';

class SettingsSection extends StatelessWidget {
  SettingsSection({super.key});
  RxBool darkMood = false.obs;
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "darkMode".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    Platform.isAndroid
                        ? Switch(
                            value: darkMood.value,
                            onChanged: (bool value) {
                              // darkMood.value = value;
                              AppTheme().changeThemeMode(darkMood.value);

                              // Get.changeTheme(darkMood.value == false
                              //     ? AppTheme().lightTheme(context)
                              //     : AppTheme().darkTheme(context));
                            })
                        : CupertinoSwitch(
                            value: darkMood.value,
                            onChanged: (bool value) {
                              darkMood.value = value;

                              AppTheme().saveThemeData(darkMood.value);
                              Get.changeTheme(darkMood.value == false
                                  ? AppTheme().lightTheme(context)
                                  : AppTheme().darkTheme(context));
                            })
                  ],
                ),
              ),
              TextButton(
                onTap: () {},
                title: "Log Out",
              ),
              TextButton(
                onTap: () {
                  changeLanguage(context);
                },
                title: "Language",
              ),
              TextButton(
                onTap: () {
                  Get.toNamed(profileUpdate);
                },
                title: "Profile",
              ),
            ],
          ),
        ));
  }

  Future changeLanguage(context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Select your language"),
            content: SizedBox(
              height: 100.h,
              child: Column(
                children: [
                  TextButton(
                      onTap: () {
                        Get.updateLocale(const Locale('bn', 'BD'));
                        box.write("bn", "Bangla");
                        print("save");
                      },
                      title: "Bangla"),
                  TextButton(
                      onTap: () {
                        Get.updateLocale(const Locale('en', 'US'));
                        box.remove("bn");
                        print("remove");
                      },
                      title: "English"),
                ],
              ),
            ),
          );
        });
  }
}

class TextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TextButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
        ),
      ),
    );
  }
}
