import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTiles extends StatelessWidget {
  final String title;
  final IconData leadIcons;

  final VoidCallback onTap;
  const CustomListTiles({
    Key? key,
    required this.leadIcons,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          leadIcons,
          size: 25.w,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 25.w,
        ),
      ),
    );
  }
}
