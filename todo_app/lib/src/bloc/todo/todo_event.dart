import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent{
  final String text;
  const AddTodo(this.text);
}
class GetTodo extends TodoEvent {}

class DeleteTodo extends TodoEvent {
  final String id;
  const DeleteTodo(this.id);
}

class UpdateTodo extends TodoEvent {
  final String id;
  final String todo;
  const UpdateTodo({required this.id, required this.todo});
}

