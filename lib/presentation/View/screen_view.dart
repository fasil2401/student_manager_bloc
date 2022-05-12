import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:student_manager_bloc/Core/constants.dart';
import 'package:student_manager_bloc/Widgets/button_text.dart';
import 'package:student_manager_bloc/presentation/Home/widgets/aap_bar_title.dart';
import 'package:student_manager_bloc/presentation/Home/widgets/name_text.dart';
import 'package:student_manager_bloc/presentation/View/widgets/custom_text.dart';

class ScreenView extends StatelessWidget {
  const ScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainThemeColor,
        title: const AppBarTitle(title: 'View Details'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: mainThemeColor,
              radius: 14.w,
              child: CircleAvatar(
                radius: 13.5.w,
                backgroundImage: const AssetImage(
                  'assets/images/profile.jpeg',
                ),
              ),
            ),
            commonSpace3,
             CustomText(text: 'Jaquiline Fernandes', color: Colors.black, size: 26.sp, weight: FontWeight.bold,),
             commonSpace1,
             CustomText(text: 'Age : 18 years',  size: 18.sp, weight: FontWeight.w600,),
             commonSpace1,
             CustomText(text: 'Class : 12 th std', size: 18.sp, weight: FontWeight.w600,),
             commonSpace1,
             CustomText(text: 'School : St. Antonys HSS',  size: 18.sp, weight: FontWeight.w600,),
             commonSpace1,
             CustomText(text: 'Place : Melooha',  size: 18.sp, weight: FontWeight.w600,),
            commonSpace1,
            



          ],
        ),
      ),
    );
  }
}
