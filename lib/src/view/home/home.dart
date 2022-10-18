import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_application/src/routes/route.dart';

class HomePageSection extends StatelessWidget {
  // const HomePageSection({super.key});
  final RxInt _currentIndex = 0.obs;
  final List _images = [
    "https://media-cdn.tripadvisor.com/media/photo-s/16/37/47/bb/photo2jpg.jpg",
    "https://www.theonlinedokan.com/wp-content/uploads/2021/12/Best-Resorts-In-Bandarban.jpg",
    "https://sgp1.digitaloceanspaces.com/cosmosgroup/news/4615525_Bandarban%20Bangladesh.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2.0,
                child: CarouselSlider(
                    items: _images.map((e) {
                      return Container(
                        height: 400.h,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                                image: NetworkImage(e), fit: BoxFit.cover)),
                      );
                    }).toList(),
                    options: CarouselOptions(
                        height: 400.h,
                        onPageChanged: (currentIndex, customPage) {
                          _currentIndex.value = currentIndex;
                        })),
              ),
              SizedBox(
                height: 5.h,
              ),
              Obx(() => DotsIndicator(
                    dotsCount: _images.length,
                    position: _currentIndex.value.toDouble(),
                  )),
              SizedBox(
                height: 10.h,
              ),
              SearchOption(
                title: "Search For Next Tour",
                onTap: () {
                  Get.toNamed(search);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              TitleSection(
                title: "For You",
                onTap: () {
                  Get.toNamed(seeAll);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Get.toNamed(details);
                              },
                              child: Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffcdcdcd),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        "https://www.state.gov/wp-content/uploads/2018/11/Denmark-2113x1406.jpg",
                                        height: 110.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      "Title",
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                    Text(
                                      "Cost",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                  ],
                                ),
                              )),
                        );
                      }),
                ),
              ),
              TitleSection(
                title: "Recent Added",
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color(0xffcdcdcd),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        "https://www.state.gov/wp-content/uploads/2018/11/Denmark-2113x1406.jpg",
                                        height: 100.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      "Title",
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                    Text(
                                      "Cost",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                  ],
                                ),
                              )),
                        );
                      }),
                ),
              ),
              TitleSection(
                title: "Recent Added",
                onTap: () {},
              ),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: const BoxDecoration(
                            color: Color(0xFfC4C4C4),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.state.gov/wp-content/uploads/2018/11/Denmark-2113x1406.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TitleSection({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
          ),
          TextButton(
              onPressed: onTap,
              child: Text(
                "Show All",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                    fontSize: 15.sp),
              ))
        ],
      ),
    );
  }
}

class SearchOption extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SearchOption({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white38,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
