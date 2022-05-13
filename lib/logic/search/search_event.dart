part of 'search_bloc.dart';

abstract class SearchEvent {}

class EnterInput extends SearchEvent{
  final String searchInput;
  EnterInput({required this.searchInput});
}

class ClearInput extends SearchEvent{}