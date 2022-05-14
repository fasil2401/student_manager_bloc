import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:student_manager_bloc/Core/constants.dart';

import '../../Core/my_icons_icons.dart';
import '../../Widgets/button_text.dart';
import '../../logic/search/search_bloc.dart';
import '../../logic/student/student_cubit.dart';
import '../../models/student_model.dart';
import '../../services/student.dart';
import '../Home/widgets/name_text.dart';
import '../Update/screen_update.dart';
import '../View/screen_view.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  TextEditingController _searchController = TextEditingController();
  String searchtext = "";

  Services studentDatabase = Services();

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
                      onTap: () {
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
                      controller: _searchController,
                      autofocus: true,
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      backgroundColor: mainThemeColor.withOpacity(0.3),
                      onChanged: (value) {
                        context
                            .read<SearchBloc>()
                            .add(EnterInput(searchInput: value));
                        searchtext = value;
                        print('Changing -----------${value}');
                      },
                      onSuffixTap: () {
                        _searchController.clear();
                        context.read<SearchBloc>().add(ClearInput());
                      },
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
              ),
              commonSpace1,
              Expanded(
                child: BlocConsumer<StudentCubit, StudentState>(
                  listener: (context, state) {
                    String process = '';
                    if (state is AddListState) {
                      process = 'Added';
                    }
                    if (state is EditListState) {
                      process = 'Edited';
                    }
                    if (state is DeleteListState) {
                      process = 'Deleted';
                    }
                    if (state is! LoadedListState && state is! NoResultsState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Student $process Successfully")));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadedListState) {
                      final List<Student> data = state.studentList;
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => ScreenView(
                                        index: data[index].key,
                                      )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: white, borderRadius: commonRadius),
                                child: Padding(
                                  padding: EdgeInsets.all(3.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 25.w,
                                        width: 25.w,
                                        child: data[index].imagePath == null
                                            ? ClipRRect(
                                                borderRadius: commonRadius,
                                                child: Image.asset(
                                                  'assets/images/profile.jpeg',
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : ClipRRect(
                                                borderRadius: commonRadius,
                                                child: Image.file(
                                                  File(data[index].imagePath),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 50.w,
                                              child: NameText(
                                                name: data[index].name,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                ScreenUpdate(
                                                                  itemKey: data[
                                                                          index]
                                                                      .key,
                                                                )));
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      primary:
                                                          const Color.fromARGB(
                                                              255, 47, 164, 51),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                  icon: Icon(
                                                    MyIcons.arrows_cw_outline,
                                                    size: 10.sp,
                                                    color: white,
                                                  ),
                                                  label: ButtonText(
                                                    text: 'Update',
                                                  ),
                                                ),
                                                ElevatedButton.icon(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (ctx) =>
                                                                  AlertDialog(
                                                                    title: Text(
                                                                      'Delete',
                                                                      style: TextStyle(
                                                                          fontSize: 16
                                                                              .sp,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              'Tajawal'),
                                                                    ),
                                                                    content:
                                                                        Text(
                                                                      'Are you Sure, You want to delete this?',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontFamily:
                                                                              'Tajawal'),
                                                                    ),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            ButtonText(
                                                                          text:
                                                                              'Wait',
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Services()
                                                                              .deleteStudent(data[index].key);
                                                                          Navigator.pop(
                                                                              context);
                                                                          BlocProvider.of<StudentCubit>(context)
                                                                              .deleteStudentListUpdated(Services().getStudentBox());
                                                                          context
                                                                              .read<SearchBloc>()
                                                                              .add(ClearInput());
                                                                        },
                                                                        child:
                                                                            ButtonText(
                                                                          text:
                                                                              'Delete',
                                                                          color:
                                                                              Colors.red,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ));
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        primary: const Color
                                                                .fromARGB(
                                                            255, 198, 21, 5),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                    icon: Icon(
                                                      MyIcons.trash_empty,
                                                      size: 12.sp,
                                                      color: white,
                                                    ),
                                                    label: ButtonText(
                                                      text: 'Delete',
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, intex) {
                          return const SizedBox();
                        },
                        itemCount: data.length,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
