import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tour_application/src/app/app_string.dart';
import 'package:tour_application/src/widget/custom_list_tiles.dart';

import '../routes/route.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        )),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 60.h),
              child: Column(
                children: [
                  Text(
                    AppStrings.appName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Colors.black),
                  ),
                  Text(
                    "Travel Agency",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black),
                  )
                ],
              ),
            ),
            Divider(thickness: 2.h),
            CustomListTiles(
              title: "Support",
              leadIcons: Icons.support_agent,
              onTap: () {
                Get.toNamed(support);
              },
            ),
            CustomListTiles(
              title: "Privacy",
              leadIcons: Icons.vpn_key,
              onTap: () {
                Get.toNamed(privacySection);
              },
            ),
            CustomListTiles(
              title: "FAQ",
              leadIcons: Icons.fact_check,
              onTap: () {
                Get.toNamed(faqSection);
              },
            ),
            CustomListTiles(
              title: "Rate Us",
              leadIcons: Icons.rate_review_outlined,
              onTap: () {
                Get.toNamed(rateUs);
              },
            ),
            CustomListTiles(
              title: "How to use",
              leadIcons: Icons.info,
              onTap: () {
                Get.toNamed(howToUse);
              },
            ),
            CustomListTiles(
              title: "Setting",
              leadIcons: Icons.settings,
              onTap: () {
                Get.toNamed(setting);
              },
            ),
          ],
        )),
      ),
    );
  }
}
