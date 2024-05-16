import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/src/bloc/todo/todo_bloc.dart';
import 'package:todo_app/src/bloc/todo/todo_event.dart';
import 'package:todo_app/src/features/todo/update_todo.dart';

class TodoContainer extends StatelessWidget {
  const TodoContainer({
    super.key,
    required this.title,
    required this.id,
    required this.date,
  });

  final String title;
  final String date;
  final String id;

  @override
  Widget build(BuildContext context) {
    return _SlidableActions(
      title: title,
      id: id,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              // Darker Shadow
              BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 15,
                  offset: const Offset(4, 4)),
              // Light Shadow
              const BoxShadow(
                  color: Colors.white, blurRadius: 15, offset: Offset(-4, -4))
            ],
          ),
          width: MediaQuery.of(context).size.width - 20,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),
                Text(
                  date,
                  // date.substring(0, 10),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SlidableActions extends StatelessWidget {
  const _SlidableActions({
    super.key,
    required this.title,
    required this.id,
    required this.child,
  });

  final String title;
  final String id;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          context.read<TodoBloc>().add(DeleteTodo(id));
          context.read<TodoBloc>().add(GetTodo());
        }),
        children: [
          SlidableAction(
            onPressed: (context) {
              update(context, title, id);
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) {
              context.read<TodoBloc>().add(DeleteTodo(id));
              context.read<TodoBloc>().add(GetTodo());
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.yellow.shade900,
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: "Share",
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.flag,
            label: "Flag",
          )
        ],
      ),
      child: child,
    );
  }
}
