import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:student_manager_bloc/Core/constants.dart';
import 'package:student_manager_bloc/Core/my_icons_icons.dart';
import 'package:student_manager_bloc/presentation/Add/screen_add.dart';
import 'package:student_manager_bloc/presentation/Search/screen_search.dart';
import 'package:student_manager_bloc/presentation/Update/screen_update.dart';
import 'package:student_manager_bloc/presentation/View/screen_view.dart';
import '../../Widgets/button_text.dart';
import 'widgets/aap_bar_title.dart';
import 'widgets/name_text.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        backgroundColor: mainThemeColor,
        title: const AppBarTitle(
          title: 'Student Manager',
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ScreenSearch()));
              },
              child: Icon(
                MyIcons.search,
                size: 18.sp,
              )),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ScreenView()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration:
                    BoxDecoration(color: white, borderRadius: commonRadius),
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 25.w,
                        width: 25.w,
                        child: ClipRRect(
                          borderRadius: commonRadius,
                          child: Image.asset(
                            'assets/images/profile.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50.w,
                              child: const NameText(
                                name: 'Jaquiline Fernandes ',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ScreenUpdate()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromARGB(255, 47, 164, 51),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
                                          builder: (ctx) => AlertDialog(
                                                title: Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                      fontFamily: 'Tajawal'),
                                                ),
                                                content: Text(
                                                  
                                                  'Are you Sure, You want to delete this?',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.sp,
                                                      fontFamily: 'Tajawal'),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: ButtonText(
                                                      text: 'Wait',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: ButtonText(
                                                      text: 'Delete',
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            const Color.fromARGB(255, 198, 21, 5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
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
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => ScreenAdd()));
        },
        backgroundColor: mainThemeColor,
        child: const Icon(MyIcons.user_add_1),
      ),
    );
  }
}
