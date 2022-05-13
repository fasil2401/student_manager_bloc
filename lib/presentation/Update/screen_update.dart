import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:student_manager_bloc/Core/constants.dart';
import 'package:student_manager_bloc/Widgets/button_text.dart';
import 'package:student_manager_bloc/logic/student/student_cubit.dart';
import 'package:student_manager_bloc/presentation/Home/widgets/aap_bar_title.dart';
import 'package:student_manager_bloc/services/student.dart';

import '../../models/student_model.dart';

class ScreenUpdate extends StatefulWidget {
  final int itemKey;
  ScreenUpdate({Key? key, required this.itemKey}) : super(key: key);

  @override
  State<ScreenUpdate> createState() => _ScreenUpdateState();
}

class _ScreenUpdateState extends State<ScreenUpdate> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _classController = TextEditingController();

  final TextEditingController _schoolController = TextEditingController();

  final TextEditingController _placeController = TextEditingController();

  final Services _studentData = Services();

  XFile? _image;

  dynamic _imagePath;

  final formKey = GlobalKey<FormState>();

  prefilledDetails() {
    Student item = _studentData.getStudentDetail(widget.itemKey);
    _nameController.text = item.name;
    _ageController.text = item.age.toString();
    _classController.text = item.standard.toString();
    _schoolController.text = item.school;
    _placeController.text = item.place;
    _imagePath = item.imagePath;
  }

  Future getImage() async {
    final ImagePicker image = ImagePicker();
    _image = await image.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      setState(() {});
      _imagePath = _image!.path;
    }
    return null;
  }

  @override
  void initState() {
    prefilledDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        
          Student _student = Student(
              name: _nameController.text,
              age: int.parse(_ageController.text),
              standard: int.parse(_classController.text),
              place: _placeController.text,
              school: _schoolController.text,
              imagePath: _imagePath);
          _studentData.editStudent(widget.itemKey, _student);
          Navigator.pop(context);
          BlocProvider.of<StudentCubit>(context)
              .editStudentListUpdated(_studentData.getStudentBox());
        
        return true;
      },
      child: Scaffold(
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
