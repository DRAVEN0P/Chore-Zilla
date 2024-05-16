import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/search/search_bloc.dart';
import 'package:todo_app/src/bloc/search/search_event.dart';
import 'package:todo_app/src/bloc/search/search_state.dart';
import 'package:todo_app/src/features/todo/search.dart';

class TMAppBar extends StatelessWidget {
  const TMAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                },
                child: const Icon(Icons.menu),
              ),
              const Row(
                children: [
                  Text(
                    "C H O R E",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "  Z I L L A",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              GestureDetector(
                  onTap: () {
                    context.read<SearchBloc>().add(ToggleSearch());
                    context.read<SearchBloc>().add(EmptySearchList());
                  },
                  child: const Icon(Icons.search))
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 2),
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return Visibility(
                    visible: state.istoggleSearchBar,
                    child: const SearchBarCus());
              },
            ),
            // child: TodoFd(controller: TextEditingController(), hintText: "hintText", obscureText: false)
          ),
        ],
      ),
    );
  }
}
