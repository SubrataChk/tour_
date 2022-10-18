import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsScreenSection extends StatelessWidget {
  // const DetailsScreenSection({super.key});
  final RxInt _currentIndex = 0.obs;
  final List _images = [
    "https://media-cdn.tripadvisor.com/media/photo-s/16/37/47/bb/photo2jpg.jpg",
    "https://www.theonlinedokan.com/wp-content/uploads/2021/12/Best-Resorts-In-Bandarban.jpg",
    "https://sgp1.digitaloceanspaces.com/cosmosgroup/news/4615525_Bandarban%20Bangladesh.jpg"
  ];

  String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String facilities =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  String destination =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite_outline_outlined))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 2.0,
                    child: CarouselSlider(
                        items: _images.map((e) {
                          return Container(
                            height: 200.h,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
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
                  CustomDescription(
                    des: description,
                    title: "Description",
                  ),
                  CustomDescription(
                    des: facilities,
                    title: "Facilities",
                  ),
                  CustomDescription(
                    des: destination,
                    title: "Destination",
                  )
                ],
              ),
            ),
          ),
          Expanded(
              // flex: 1,
              child: Container(
            height: 100.h,
            color: Colors.white38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Name",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.call_outlined)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.message_outlined)),
                  ],
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}

class CustomDescription extends StatelessWidget {
  final String title;
  final String des;
  const CustomDescription({
    required this.des,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
          ),
          Text(
            des,
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
          ),
          Divider(
            thickness: 2.h,
          )
        ],
      ),
    );
  }
}
