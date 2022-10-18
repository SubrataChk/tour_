import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/src/app/app_string.dart';
import 'package:tour_application/src/routes/route.dart';
import 'package:tour_application/src/view/add/add.dart';
import 'package:tour_application/src/view/favorite/favorite.dart';
import 'package:tour_application/src/view/home/home.dart';
import 'package:tour_application/src/widget/drawer.dart';

import '../../widget/custom_list_tiles.dart';

class BottomNavigationSection extends StatelessWidget {
  BottomNavigationSection({super.key});

  final RxInt _currentIndex = 0.obs;
  final RxBool _drawer = false.obs;
  final _pages = [
    // ignore: avoid_unnecessary_containers
    HomePageSection(),

    AddSection(),
    const FavoritePageSection(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () {
            _exitDialog(context);
            return Future.value(true);
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                AppStrings.appName.tr,
                style: TextStyle(color: Colors.black, fontSize: 18.sp),
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex.value,
                onTap: (value) {
                  _currentIndex.value = value;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_outlined), label: "Add"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outline), label: "Favorite"),
                ]),
            body: _pages[_currentIndex.value],
            drawer: CustomDrawer(),
          ),
        ));
  }

  Future _exitDialog(context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure you want to exit!"),
            content: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("Yes"),
                ),
              ],
            ),
          );
        });
  }
}
