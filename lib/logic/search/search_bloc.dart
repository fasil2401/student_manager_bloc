import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_manager_bloc/services/student.dart';

import '../../models/student_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc()
      : super(SearchResult(studentList: Services().getStudents())) {
    on<SearchEvent>((event, emit) {
      if (event is EnterInput) {
        List<Student> data = Services()
            .getStudents()
            .where((element) => element.name
                .toLowerCase()
                .contains(event.searchInput.toLowerCase()))
            .toList();
          emit(SearchResult(studentList: data));
      }
      if (event is ClearInput) {
        emit(SearchResult(studentList: Services().getStudents()));
      }
    });
  }
}
