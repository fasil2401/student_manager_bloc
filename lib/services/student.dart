import 'package:hive/hive.dart';
import 'package:student_manager_bloc/models/student_model.dart';

class Services{
  final _student = Hive.box<Student>('student_box');

  Box<Student> getStudentBox(){
    final box = this._student;
    return box;
  }

  List<Student> getStudents(){
    final students = _student.values;
    return students.toList();
  }

  void addStudent(Student student) {
    _student.add(student);
  }

  //get a student detail
  Student getStudentDetail(int key){
    Student student = _student.get(key)!;
    return student;
  }

  //edit student
  void editStudent(int key, Student student) {
    _student.put(key, student);
  }

  //delete student
  void deleteStudent(int key) {
    _student.delete(key);
  }
}