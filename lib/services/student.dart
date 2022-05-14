import 'package:hive/hive.dart';
import 'package:student_manager_bloc/models/student_model.dart';

class Services{
  final box = Hive.box<Student>('student_box');

  Box<Student> getStudentBox(){
    final box = this.box;
    return box;
  }

  List<Student> getStudents(){
    final List<Student> studentList = box.values.toList();
    return studentList;
  }

  void addStudent(Student student) {
    box.add(student);
  }

  //get a student detail
  Student getStudentDetail(int key){
    Student student = box.get(key)!;
    return student;
  }

  //edit student
  void editStudent(int key, Student student) {
    box.put(key, student);
  }

  //delete student
  void deleteStudent(int key) {
    box.delete(key);
  }
}