import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/todo/todo_bloc.dart';
import 'package:todo_app/src/bloc/todo/todo_event.dart';
import 'package:todo_app/src/ui/widgets/neu_box.dart';
import 'package:todo_app/src/ui/widgets/todo_field.dart';

Widget floatingActionBar(context) {
  final todoText = TextEditingController();
  return Padding(
    padding: const EdgeInsets.only(left: 40),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "A D D   T O D O",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TodoFd(
                        controller: todoText,
                        hintText: "Todo",
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green.shade400),
                        ),
                        onPressed: () {
                          context.read<TodoBloc>().add(AddTodo(todoText.text));
                          context.read<TodoBloc>().add(GetTodo());
                          Navigator.pop(context);
                          todoText.clear();
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: const NeuBox(
            child: Icon(Icons.add),
          ),
        ),
      ],
    ),
  );
}
