import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/src/todo/data/model/todo.model.dart';
import 'package:equatable/equatable.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(const TodoListState(todoList: []));

  void addTodo(TodoModel todo) {
    final newState = state.copyWith(todoList: [...state.todoList, todo]);
    emit(newState);
  }

  /// This method is used to remove a todo from the list
  /// It will emit a new state with the todo removed
  void removeTodo(TodoModel todo) {
    emit(state.copyWith(
      todoList: state.todoList.where((element) => element != todo).toList(),
    ));
  }

  /// updateTodo is used to update the todo item
  /// It will emit a new state with the todo updated
  void updateTodo(TodoModel todo) {
    emit(state.copyWith(
      todoList: [
        ...state.todoList.map((element) {
          if (element.id == todo.id) {
            log("yes");
            return todo;
          }
          return element;
        }).toList()
      ],
    ));
  }

  /// delete todo from the list
  void deleteTodo(TodoModel todo) {
    emit(state.copyWith(
      todoList:
          state.todoList.where((element) => element.id != todo.id).toList(),
    ));
  }
}
