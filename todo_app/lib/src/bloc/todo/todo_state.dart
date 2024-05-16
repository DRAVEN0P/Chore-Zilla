import 'package:equatable/equatable.dart';
import 'package:todo_app/src/models/todo_model.dart';

class TodoState extends Equatable {
  final List<Todo> todoList;

  const TodoState({
    this.todoList = const [],
  });

  TodoState copyWith({List<Todo>? todoList}) {
    return TodoState(
        todoList: todoList ?? this.todoList
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todoList];
}
