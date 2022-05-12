import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Core/constants.dart';


class CustomText extends StatelessWidget {

  final String text;
   Color color;
  final double size;
  final FontWeight weight;

   CustomText({
    Key? key,
    required this.weight,
    required this.size,
    required this.text,
    this.color = black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: 'Tajawal',
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}