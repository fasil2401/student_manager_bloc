import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:student_manager_bloc/Core/constants.dart';
import 'package:student_manager_bloc/Widgets/button_text.dart';
import 'package:student_manager_bloc/presentation/Home/widgets/aap_bar_title.dart';
import 'package:student_manager_bloc/services/student.dart';

import '../../logic/student/student_cubit.dart';
import '../../models/student_model.dart';

class ScreenAdd extends StatefulWidget {
  ScreenAdd({Key? key}) : super(key: key);

  @override
  State<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {
  final Services _studentData = Services();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _classController = TextEditingController();

  final TextEditingController _schoolController = TextEditingController();

  final TextEditingController _placeController = TextEditingController();

  XFile? _image;

  dynamic _imagePath;

  Future getImage() async {
    final ImagePicker image = ImagePicker();
    _image = await image.pickImage(source: ImageSource.camera);
    if (_image != null) {
      setState(() {});
      _imagePath = _image!.path;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        
          Student student = Student(
              name: _nameController.text,
              age: int.parse(_ageController.text),
              standard: int.parse(_classController.text),
              place: _placeController.text,
              school: _schoolController.text,
              imagePath: _imagePath);
          Services().addStudent(student);
          Navigator.pop(context);
          BlocProvider.of<StudentCubit>(context)
              .addStudentListUpdated(_studentData.getStudentBox());
        
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainThemeColor,
          title: const AppBarTitle(title: 'Add Student'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Stack(
              children: [
                _image == null
                    ? Align(
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
                      )
                    : Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 40.w,
                          width: 40.w,
                          child: ClipRRect(
                            borderRadius: commonRadius,
                            child: Image.file(
                              File(_imagePath),
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
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: mainThemeColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(3.w),
                            bottomRight: Radius.circular(3.w),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter name";
                        } else {
                          if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                              .hasMatch(value)) {
                            return "please enter a valid name";
                          }
                          return null;
                        }
                      },
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
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter age";
                              } else {
                                if (RegExp(r'^[0-9]*$').hasMatch(value) &&
                                    int.parse(value) < 150) {
                                  return null;
                                } else {
                                  return "invalid input";
                                }
                              }
                            },
                            controller: _ageController,
                            decoration: fieldDecoration('Age', 'Enter Age'),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter class";
                              } else {
                                if (RegExp(r'^[0-9]*$').hasMatch(value) &&
                                    value.length < 3) {
                                  return null;
                                } else {
                                  return "invalid input";
                                }
                              }
                            },
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
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter School";
                        }
                        return null;
                      },
                      controller: _schoolController,
                      decoration:
                          fieldDecoration('School', 'Enter School Name'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter place";
                        }
                        return null;
                      },
                      controller: _placeController,
                      decoration: fieldDecoration('Place', 'Enter Place Name'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
