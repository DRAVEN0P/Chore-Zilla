import 'package:equatable/equatable.dart';
import 'package:todo_app/src/models/todo_model.dart';

class SearchState extends Equatable {
  final bool istoggleSearchBar;
  final List<Todo> searchList;

  const SearchState({
    this.istoggleSearchBar = false,
    this.searchList = const [],
  });

  SearchState copyWith({bool? bool, List<Todo>? searchList}) {
    return SearchState(
      istoggleSearchBar: bool ?? istoggleSearchBar,
      searchList: searchList ?? this.searchList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [istoggleSearchBar,searchList];
}
