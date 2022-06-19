import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:student_manager_bloc/Core/constants.dart';
import 'package:student_manager_bloc/Widgets/button_text.dart';
import 'package:student_manager_bloc/models/student_model.dart';
import 'package:student_manager_bloc/presentation/Home/widgets/aap_bar_title.dart';
import 'package:student_manager_bloc/presentation/Home/widgets/name_text.dart';
import 'package:student_manager_bloc/presentation/View/widgets/custom_text.dart';
import 'package:student_manager_bloc/services/student.dart';

class ScreenView extends StatelessWidget {
  final Services _studentData = Services();
  final int index;
  ScreenView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Student student = _studentData.getStudentDetail(index);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainThemeColor,
        title: const AppBarTitle(title: 'View Details'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(

          children: [
            Container(
              height: 30.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: mainThemeColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w,),
              child: Padding(
                padding:  EdgeInsets.only(top: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: mainThemeColor,
                        radius: 22.w,
                        child: student.imagePath == null ?CircleAvatar(
                          radius: 19.w,
                          backgroundImage: const AssetImage(
                            'assets/images/profile.jpeg',
                          ),
                        ): CircleAvatar(
                          radius: 19.w,
                          backgroundImage:  FileImage(
                            File(student.imagePath),
                          ),
                        ),
                      ),
                      commonSpace3,
                      CustomText(
                        text: student.name,
                        color: Colors.black,
                        size: 30.sp,
                        weight: FontWeight.bold,
                      ),
                      commonSpace1,
                      CustomText(
                        text: 'Age : ${student.age} years',
                        size: 18.sp,
                        weight: FontWeight.w600,
                      ),
                      commonSpace1,
                      CustomText(
                        text: 'Class : ${student.standard} th std',
                        size: 18.sp,
                        weight: FontWeight.w600,
                      ),
                      commonSpace1,
                      CustomText(
                        text: 'School : ${student.school}',
                        size: 18.sp,
                        weight: FontWeight.w600,
                      ),
                      commonSpace1,
                      CustomText(
                        text: 'Place : ${student.place}',
                        size: 18.sp,
                        weight: FontWeight.w600,
                      ),
                      commonSpace1,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
