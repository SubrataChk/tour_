import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:tour_application/src/app/app_color.dart';
import 'package:tour_application/src/app/app_image.dart';
import 'package:tour_application/src/routes/route.dart';
import 'package:tour_application/src/service/auth.dart';

import '../../../widget/custom_button.dart';
import '../../../widget/custom_text_field.dart';

// ignore: must_be_immutable
class SignUpSection extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RxBool _value = false.obs;

  SignUpSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 10.w),
              child: Text(
                "Create \nYour Account ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: AppColors.violetColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Text(
                "Create you account and start new journey",
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            CustomTextFormField(
              keyType: true,
              obSecure: false,
              controller: _emailController,
              hintText: "Email",
              icons: CupertinoIcons.mail,
            ),
            CustomTextFormField(
              controller: _passwordController,
              hintText: "Password",
              icons: Icons.vpn_key,
              keyType: false,
              obSecure: true,
            ),
            // ignore: unrelated_type_equality_checks
            Obx(() => _value == false
                ? CustomButton(
                    title: "Create Account",
                    onTap: () {
                      _value.value = true;
                      Auth().registration(
                          _emailController.text, _passwordController.text);

                      _value.value = false;
                    },
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                    child: const Center(child: CircularProgressIndicator()),
                  )),
            Align(
              alignment: Alignment.center,
              child: Text(
                "--OR--",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppImage.google,
                      )),
                  IconButton(
                      onPressed: () {}, icon: Image.asset(AppImage.facebook))
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: "Already an user?  ",
                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      children: [
                    TextSpan(
                        text: "Log In",
                        style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Print
                            Get.toNamed(login);
                          })
                  ])),
            )
          ],
        ),
      )),
    );
  }
}
