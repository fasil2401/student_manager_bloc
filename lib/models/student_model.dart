// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class Student extends HiveObject{

  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;
  @HiveField(2)
  final int standard;
  @HiveField(3)
  final String school;
  @HiveField(4)
  final String place;
  @HiveField(5)
  final dynamic imagePath;
  
  
  Student({
    required this.name,
    required this.age,
    required this.standard,
    required this.school,
    required this.place,
    required this.imagePath,
  });

  

}
