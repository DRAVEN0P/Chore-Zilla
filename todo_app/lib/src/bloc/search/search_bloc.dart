import 'package:bloc/bloc.dart';
import 'package:todo_app/src/bloc/search/search_event.dart';
import 'package:todo_app/src/bloc/search/search_state.dart';
import 'package:todo_app/src/models/todo_model.dart';

class SearchBloc extends Bloc<SearchBarEvents, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<ToggleSearch>(_toggle);
    on<SearchTodo>(_searchTodo);
    on<EmptySearchList>(_emptySearchList);
  }

  void _toggle(ToggleSearch event, Emitter<SearchState> emit) {
    bool isTrue = !state.istoggleSearchBar;
    emit(state.copyWith(bool: isTrue));
  }

  void _searchTodo(SearchTodo event, Emitter<SearchState> emit) {
    List<Todo> oldList = event.todoList;
    if (event.text.isEmpty) {
      emit(state.copyWith(searchList: []));
    } else {
      List<Todo> tempData = oldList
          .where((element) =>
              element.todo.toString().toLowerCase().contains(event.text))
          .toList();
      if (tempData.isEmpty) {
        emit(state.copyWith(searchList: []));
      } else {
        emit(state.copyWith(searchList: tempData));
      }
    }
  }

  void _emptySearchList(EmptySearchList event, Emitter<SearchState> emit) {
    List<Todo> emp = [];
    emit(state.copyWith(searchList: emp));
  }
}
