import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../models/student_model.dart';
import '../search/search_bloc.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final List<Student> list;
  late StreamSubscription streamSubscription;
  final SearchBloc searchBloc;

  //initial emit
  StudentCubit({required this.list,required this.searchBloc}) : super(StudentInitial()){
    emit(LoadedListState(studentList: list));
    streamSubscription = searchBloc.stream.listen((event) {
      
        if(event is SearchResult){
          if(event.studentList.isNotEmpty){
            studentListUpdated(event.studentList);
          }else{
            emit(NoResultsState());
          }
        }
    });
  }

  //list updated
  void studentListUpdated(List<Student> list){
    emit(LoadedListState(studentList: list));
  }

  //add list emit
  void addStudentListUpdated(Box<Student> box) {
    emit(AddListState());
    emit(LoadedListState(studentList: box.values.toList()));
  }

  //edit list emit
  void editStudentListUpdated(Box<Student> box) {
    emit(EditListState());
    emit(LoadedListState(studentList: box.values.toList()));
  }

  //delete list emit
  void deleteStudentListUpdated(Box<Student> box) {
    emit(DeleteListState());
    emit(LoadedListState(studentList: box.values.toList()));
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

}