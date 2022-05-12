import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Core/constants.dart';


class ButtonText extends StatelessWidget {

  final String text;
   Color color;
   ButtonText({
    Key? key,
    
    required this.text,
    this.color = white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: 'Tajawal',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}