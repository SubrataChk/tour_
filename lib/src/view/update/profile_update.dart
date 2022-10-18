import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_application/src/routes/route.dart';
import 'package:tour_application/src/service/user_form.dart';
import 'package:tour_application/src/widget/custom_button.dart';
import 'package:tour_application/src/widget/custom_text_field.dart';
import 'package:tour_application/src/widget/show_msg.dart';

import '../../app/app_color.dart';

// ignore: must_be_immutable
class UserProfileUpdate extends StatelessWidget {
  UserProfileUpdate({super.key});
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final Rx<TextEditingController> _dob = TextEditingController().obs;
  Rx<DateTime> dateSelect = DateTime.now().obs;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("User_Information")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return setUserData(data, context);
            }
          },
        ),
      ),
    );
  }

  update(data) async {
    try {
      CollectionReference regData =
          FirebaseFirestore.instance.collection("User_Information");
      final user = FirebaseAuth.instance.currentUser!.uid;

      regData.doc(user).update({
        "name": _fullName.text,
        "phone": _phoneNumber.text,
        "address": _address.text,
        "dob": _dob.value.text,
        "gender": _gender.text
      }).then((value) {
        showMessage("Profile updated successfully");
      }).then((value) {
        Get.back();
      }).catchError((e) {
        showMessage(e.toString());
      });
    } catch (e) {
      showMessage(e.toString());
    }
  }

  setUserData(data, context) {
    _fullName.text = data["name"];
    _dob.value.text = data["dob"];
    _address.text = data["address"];
    _phoneNumber.text = data["phone"].toString();
    _gender.text = data["gender"].toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, left: 10.w),
          child: Text(
            "Update Your Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
                color: AppColors.violetColor),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextFormField(
            controller: _fullName,
            hintText: "Full Name",
            icons: Icons.person,
            obSecure: false,
            keyType: true),
        CustomTextFormField(
            controller: _phoneNumber,
            hintText: "Phone Number",
            icons: Icons.phone_iphone,
            obSecure: false,
            keyType: true),
        CustomTextFormField(
            controller: _address,
            hintText: "Address",
            icons: Icons.person,
            obSecure: false,
            keyType: true),
        Obx(() => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
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
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: ToggleSwitch(
            initialLabelIndex: 0,
            totalSwitches: 3,
            labels: const ['Male', 'Female', 'Others'],
            onToggle: (index) {
              if (index == 0) {
                _gender.text = "Male";
              } else if (index == 1) {
                _gender.text = "Female";
              } else {
                _gender.text = "Others";
              }
            },
          ),
        ),
        CustomButton(
            onTap: () async {
              update(data);
            },
            title: "Update")
      ],
    );
  }
}
