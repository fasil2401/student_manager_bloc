part of 'search_bloc.dart';

abstract class SearchState {
  
}

class SearchResult extends SearchState{
   final List<Student> studentList;
  SearchResult({required this.studentList});
}
