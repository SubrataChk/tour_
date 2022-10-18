import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomInfoField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final int maxLine;
  const CustomInfoField({
    Key? key,
    required this.controller,
    required this.maxLine,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
            ),
          ),
          TextFormField(
            controller: controller,
            maxLines: maxLine,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white60,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: EdgeInsets.all(15)),
          )
        ],
      ),
    );
  }
}
