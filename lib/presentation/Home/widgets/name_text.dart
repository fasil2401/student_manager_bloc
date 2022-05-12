import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Core/constants.dart';

class NameText extends StatelessWidget {

  final String name ;
  const NameText({
    Key? key, required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name,
    maxLines: 2,
    style: TextStyle(
      color: black,
      fontFamily: 'Tajawal',
      fontSize: 22.sp,
      fontWeight: FontWeight.bold
    ),);
  }
}
