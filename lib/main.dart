import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'package:student_manager_bloc/logic/student/student_cubit.dart';
import 'package:student_manager_bloc/presentation/Home/screen_home.dart';
import 'package:student_manager_bloc/services/student.dart';

import 'logic/search/search_bloc.dart';
import 'models/student_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Student>('student_box');
  runApp(StudentManager(
    searchBloc: SearchBloc(),
  ));
}

class StudentManager extends StatelessWidget {
  final SearchBloc? searchBloc;
  const StudentManager({Key? key, this.searchBloc}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => StudentCubit(
                  list: Services().getStudents(), searchBloc: searchBloc!),
            ),
            BlocProvider(create: (context) => searchBloc!),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const ScreenHome(),
          ),
        );
      },
    );
  }
}
