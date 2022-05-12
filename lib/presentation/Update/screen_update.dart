import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:student_manager_bloc/Core/constants.dart';
import 'package:student_manager_bloc/Widgets/button_text.dart';
import 'package:student_manager_bloc/presentation/Home/widgets/aap_bar_title.dart';

class ScreenUpdate extends StatelessWidget {
  ScreenUpdate({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainThemeColor,
        title: const AppBarTitle(title: 'Update Student '),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 40.w,
                  width: 40.w,
                  child: ClipRRect(
                    borderRadius: commonRadius,
                    child: Image.asset(
                      'assets/images/profile.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: mainThemeColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3.w),
                          bottomRight: Radius.circular(3.w),
                        ),
                      ),
                      child:  Padding(
                        padding:const EdgeInsets.all(8.0),
                        child: ButtonText(text: 'upload'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: fieldDecoration('Name', 'Enter Full Name'),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: _ageController,
                          decoration: fieldDecoration('Age', 'Enter Age'),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: _classController,
                          decoration: fieldDecoration('Class', 'Enter Class'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: _schoolController,
                    decoration: fieldDecoration('School', 'Enter School Name'),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: _placeController,
                    decoration: fieldDecoration('Place', 'Enter Place Name'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration fieldDecoration(String label, String hint) {
    return InputDecoration(
      isDense: true,
      filled: true,
      labelText: label,
      labelStyle: TextStyle(
          color: mainThemeColor,
          fontFamily: 'Tajawal',
          fontSize: 14.sp,
          fontWeight: FontWeight.w600),
      hintText: hint,
      fillColor: Colors.blue.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
