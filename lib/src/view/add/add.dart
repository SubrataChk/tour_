import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/src/routes/route.dart';
import 'package:tour_application/src/view/add/last_step.dart';
import 'package:tour_application/src/widget/custom_button.dart';

import '../../widget/info_field.dart';

class AddSection extends StatelessWidget {
  // const AddSection({super.key});
  final TextEditingController _ownerName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _cost = TextEditingController();
  final TextEditingController _facilities = TextEditingController();
  final TextEditingController _destination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Text(
                  "If you have any problems, please contact us. We are at your service all the time",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              CustomInfoField(
                title: "Owner Name",
                maxLine: 1,
                controller: _ownerName,
              ),
              CustomInfoField(
                title: "Description",
                maxLine: 1,
                controller: _description,
              ),
              CustomInfoField(
                title: "Cost",
                maxLine: 1,
                controller: _cost,
              ),
              CustomInfoField(
                title: "Facilities",
                maxLine: 5,
                controller: _facilities,
              ),
              CustomInfoField(
                title: "Destination",
                maxLine: 2,
                controller: _destination,
              ),
              CustomButton(
                  onTap: () {
                    Get.toNamed(lastStep,
                        arguments: LastStepDetails(
                          name: _ownerName.text,
                          description: _description.text,
                          cost: _cost.text,
                          facility: _facilities.text,
                          destination: _description.text,
                        ));
                  },
                  title: "Next")
            ],
          ),
        )));
  }
}
