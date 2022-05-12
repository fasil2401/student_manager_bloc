import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:student_manager_bloc/Core/constants.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                      child: Icon(
                    Icons.arrow_back,
                    color: mainThemeColor,
                    size: 20.sp,
                  )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Flexible(
                    child: CupertinoSearchTextField(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      backgroundColor: mainThemeColor.withOpacity(0.3),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: mainThemeColor,
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.xmark_circle_fill,
                        color: mainThemeColor,
                      ),
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 75, 76, 117)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
