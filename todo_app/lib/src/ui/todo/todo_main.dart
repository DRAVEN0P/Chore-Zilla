import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/search/search_bloc.dart';
import 'package:todo_app/src/bloc/search/search_event.dart';
import 'package:todo_app/src/bloc/search/search_state.dart';
import 'package:todo_app/src/bloc/todo/todo_bloc.dart';
import 'package:todo_app/src/bloc/todo/todo_event.dart';
import 'package:todo_app/src/bloc/todo/todo_state.dart';
import 'package:todo_app/src/ui/todo/todo_appbar.dart';
import 'package:todo_app/src/ui/todo/todo_container.dart';
import 'package:todo_app/src/ui/todo/todo_floatingActionBar.dart';

class TodoMainUi extends StatefulWidget {
  const TodoMainUi({super.key});

  @override
  State<TodoMainUi> createState() => _TodoMainUiState();
}

class _TodoMainUiState extends State<TodoMainUi> {
  @override
  void initState() {
    context.read<TodoBloc>().add(GetTodo());
  }

  @override
  Widget build(BuildContext context) {
    bool hasNotified = false;
    return Scaffold(
      floatingActionButton: floatingActionBar(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              const TMAppBar(),
              BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: NotificationListener(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (scrollInfo is ScrollUpdateNotification &&
                              scrollInfo.metrics.pixels < 0 &&
                              !hasNotified) {
                            context.read<SearchBloc>().add(ToggleSearch());
                            hasNotified = true;
                          } else if (scrollInfo is ScrollUpdateNotification &&
                              scrollInfo.metrics.pixels > 0 &&
                              hasNotified) {
                            context.read<SearchBloc>().add(ToggleSearch());
                            context.read<SearchBloc>().add(EmptySearchList());
                            hasNotified = false;
                          }
                          return false;
                        },
                        child: BlocBuilder<SearchBloc, SearchState>(
                          builder: (context, stateA) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: stateA.searchList.isNotEmpty
                                  ? stateA.searchList.length
                                  : state.todoList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TodoContainer(
                                  title: stateA.searchList.isNotEmpty
                                      ? stateA.searchList[index].todo
                                      : state.todoList[index].todo,
                                  id: stateA.searchList.isNotEmpty
                                      ? stateA.searchList[index].id
                                      : state.todoList[index].id,
                                  date: stateA.searchList.isNotEmpty
                                      ? stateA.searchList[index].date
                                      : state.todoList[index].date,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
