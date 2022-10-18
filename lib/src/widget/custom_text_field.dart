import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icons;
  final TextEditingController controller;
  final bool keyType;
  final bool obSecure;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icons,
      required this.obSecure,
      required this.keyType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: TextFormField(
        obscureText: obSecure,
        keyboardType:
            keyType == true ? TextInputType.emailAddress : TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(icons),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            contentPadding: EdgeInsets.all(15.r)),
      ),
    );
  }
}
