import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:random_string/random_string.dart';
import 'package:todo_app/src/bloc/todo/todo_event.dart';
import 'package:todo_app/src/bloc/todo/todo_state.dart';
import 'package:todo_app/src/bloc/todo/todo_utils.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/utils/firebase/database.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>(_addTodo);
    on<GetTodo>(_getData);
    on<DeleteTodo>(_deleteTodo);
    on<UpdateTodo>(_updateTodo);
  }

  DatabaseMethods db = DatabaseMethods();

  void _addTodo(AddTodo event, Emitter<TodoState> emit) {
    String id = randomAlphaNumeric(10);
    String date = getCurrentDate();
    Map<String, dynamic> temp = {
      "id": id,
      "date": date,
      "todo": event.text,
    };
    db.addTodo(temp, id);
    emit(state.copyWith());
  }

  void _getData(GetTodo event,Emitter<TodoState> emit) async {
    List<Todo> todos = [];
    var data = await DatabaseMethods().getTodo();
    for (var snapshot in data) {
      if (snapshot.exists) {
        var temp = snapshot.data();
        String jsonString = jsonEncode(temp);
        Map<String, dynamic> fData = jsonDecode(jsonString);
        Todo tempTodo = Todo(todo: fData["todo"], id: fData["id"], date: fData["date"]);
        todos.add(tempTodo);
      }
    }
    emit(state.copyWith(todoList: todos));
  }

  void _deleteTodo(DeleteTodo event,Emitter<TodoState> emit){
    db.deleteTodo(event.id);
    emit(state.copyWith());
  }

  void _updateTodo(UpdateTodo event,Emitter<TodoState> emit){
    String date = getCurrentDate();
    Map<String, dynamic> temp = {
      "id": event.id,
      "date": date,
      "todo": event.todo,
    };
    db.updateTodo(temp, event.id);
    emit(state.copyWith());
  }
}
