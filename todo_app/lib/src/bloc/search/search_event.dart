import 'package:equatable/equatable.dart';
import 'package:todo_app/src/models/todo_model.dart';

abstract class SearchBarEvents extends Equatable {
  const SearchBarEvents();

  @override
  List<Object> get props => [];
}

class ToggleSearch extends SearchBarEvents {}

class SearchTodo extends SearchBarEvents {
  final String text;
  final List<Todo> todoList;

  const SearchTodo(this.text, this.todoList);
}

class EmptySearchList extends SearchBarEvents {}