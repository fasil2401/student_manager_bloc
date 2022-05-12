import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBarTitle extends StatelessWidget {
 final String title;
  const AppBarTitle({
    Key? key, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: TextStyle(
      fontSize: 22.sp,
      fontFamily: 'Tajawal',
      fontWeight: FontWeight.w600,
    ),
    );
  }
}