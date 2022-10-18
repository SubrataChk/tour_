import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Text(
          'Support',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "If you have any problems, please contact us. We are at your service all the time",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
              ),
              Divider(
                thickness: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  "Phone",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              const SelectableText("01975962962"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  "E-Mail",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              const SelectableText("subrataclash@gmail.com"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  "Facebook",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              const SelectableText("facebook.com/subrataclash")
            ],
          ),
        ),
      )),
    );
  }
}
