import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tour_application/src/widget/custom_button.dart';
import 'package:tour_application/src/widget/info_field.dart';
import 'package:tour_application/src/widget/show_msg.dart';

import '../../routes/route.dart';

class LastStepDetails extends StatefulWidget {
  String name;
  String description;
  String cost;
  String facility;
  String destination;
  LastStepDetails({
    super.key,
    required this.name,
    required this.description,
    required this.cost,
    required this.facility,
    required this.destination,
  });
  @override
  State<LastStepDetails> createState() => _LastStepDetailsState();
}

class _LastStepDetailsState extends State<LastStepDetails> {
  final TextEditingController _phone = TextEditingController();

  final Rx<TextEditingController> _dob = TextEditingController().obs;

  Rx<DateTime> dateSelect = DateTime.now().obs;
  final RxBool _value = false.obs;

  //Select Date:
  _selectDate(context) async {
    final selectDate = await showDatePicker(
        context: context,
        initialDate: dateSelect.value,
        firstDate: DateTime(1965),
        lastDate: DateTime(2050));

    // ignore: unrelated_type_equality_checks
    if (selectDate != null && selectDate != dateSelect) {
      _dob.value.text =
          "${selectDate.day} - ${selectDate.month} - ${selectDate.year}";
    }
  }

  //Get Image:
  final ImagePicker _imagePicker = ImagePicker();
  List<String> imageUrls = [];

  List<XFile>? images;

  Future multipleImage() async {
    images = await _imagePicker.pickMultiImage();
    setState(() {});
  }

  Future uploadData() async {
    try {
      if (images != null) {
        _value.value = true;
        for (int i = 0; i < images!.length; i++) {
          File imageFile = File(images![i].path);

          UploadTask uploadTask = FirebaseStorage.instance
              .ref(FirebaseAuth.instance.currentUser!.uid)
              .child(images![i].name)
              .putFile(imageFile);
          TaskSnapshot snapshot = await uploadTask;
          String imageList = await snapshot.ref.getDownloadURL();
          imageUrls.add(imageList);

          //Upload Data:
          if (imageUrls.isNotEmpty) {
            CollectionReference data =
                FirebaseFirestore.instance.collection("all_data");

            data.doc(FirebaseAuth.instance.currentUser!.uid).set({
              "name": widget.name,
              "description": widget.description,
              "cost": widget.cost,
              "facility": widget.facility,
              "destination": widget.destination,
              "Images": FieldValue.arrayUnion(imageUrls),
              "dob": _dob.value.text,
              "phone": _phone.text
            }).whenComplete(() {
              showMessage("Upload successful");
              _value.value = false;
            });

            Get.toNamed(addSection);
          }
        }
      } else {
        _value.value = true;
        showMessage("Something is wrong");
        _value.value = false;
      }
    } catch (e) {
      _value.value = true;
      showMessage(e.toString());
      _value.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInfoField(
                controller: _phone, maxLine: 1, title: "Phone Number"),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                  child: TextFormField(
                    // readOnly: true,
                    controller: _dob.value,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: const Icon(Icons.calendar_month)),
                        hintText: "Date Of Birth",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        contentPadding: EdgeInsets.all(15.r)),
                  ),
                )),
            Text(
              "Choose Images",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                color: Color(0xFFE9EBED),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
              ),
              child: Center(
                child: FloatingActionButton(
                  onPressed: () => multipleImage(),
                  child: const Icon(Icons.add),
                ),
              ),
            ),
            SizedBox(
              height: 150.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Container(
                          width: 200,
                          child: images?.length == null
                              ? const Center(
                                  child: Text("Images are empty"),
                                )
                              : Image.file(
                                  File(images![index].path),
                                  fit: BoxFit.cover,
                                )),
                    );
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => _value.value == false
                ? CustomButton(
                    onTap: () {
                      uploadData();
                    },
                    title: "Upload")
                : const CircularProgressIndicator())
          ],
        ),
      )),
    );
  }
}
