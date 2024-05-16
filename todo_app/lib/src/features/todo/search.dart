import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/search/search_bloc.dart';
import 'package:todo_app/src/bloc/search/search_event.dart';
import 'package:todo_app/src/bloc/todo/todo_bloc.dart';
import 'package:todo_app/src/models/todo_model.dart';

class SearchBarCus extends StatelessWidget {
  const SearchBarCus({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final List<Todo> todoList = context.read<TodoBloc>().state.todoList;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            controller: controller,
            onChanged: (text){
              context.read<SearchBloc>().add(SearchTodo(text,todoList));
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "🔍 Search",
            ),
          ),
        ),
      ),
    );
  }
}
