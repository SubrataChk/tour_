import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_application/src/routes/route.dart';
import 'package:tour_application/src/service/user_form.dart';
import 'package:tour_application/src/widget/custom_button.dart';
import 'package:tour_application/src/widget/custom_text_field.dart';

import '../../../app/app_color.dart';

// ignore: must_be_immutable
class UserFormSection extends StatelessWidget {
  UserFormSection({super.key});
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 10.w),
              child: Text(
                "Tell Us More About You ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: AppColors.violetColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Text(
                "We will not share your information outside this application",
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 40.h,
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
                  await UserForm().sendFormData(
                      _fullName.text,
                      int.parse(_phoneNumber.text),
                      _address.text,
                      _dob.value.text,
                      _gender.text);
                },
                title: "Submit")
          ],
        ),
      )),
    );
  }
}
