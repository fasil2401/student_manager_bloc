part of 'student_cubit.dart';

abstract class StudentState extends Equatable{

  const StudentState();
}

class StudentInitial extends StudentState {
 
  @override
  List<Object> get props => [];
}

class LoadedListState extends StudentState {
  final List<Student> studentList;
  LoadedListState({required this.studentList});
  @override
  List<Student> get props => studentList;
}

class AddListState extends StudentState {
  // AddListState(): super(list: []);
  @override
  List<Object?> get props => [];
}

class EditListState extends StudentState {
  // EditListState(): super(list: []);
  @override
  List<Object?> get props => [];
}

class DeleteListState extends StudentState {
  // DeleteListState(): super(list: []);
  @override
  List<Object?> get props => [];
}

class NoResultsState extends StudentState {
  // NoResultsState(): super(list: []);
  @override
  List<Object?> get props => [];
}
