part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  const TodoListState({required this.todoList});

  final List<TodoModel> todoList;

  @override
  List<Object?> get props => [todoList];

  TodoListState copyWith({List<TodoModel>? todoList}) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }
}
