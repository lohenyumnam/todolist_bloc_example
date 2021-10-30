import 'package:bloc_example/src/todo/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use watch to listen to changes in the state
    // so every time the state changes, the widget is rebuilt
    final todoListState = context.watch<TodoListCubit>().state;
    final todoList = todoListState.todoList;

    // if the list is empty, show a message
    if (todoList.isEmpty) {
      return Center(
        child: Text(
          'Your todo list is empty',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        final todo = todoList[index];
        return ListTile(
          title: Text(todo.id + " " + todo.title),
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (bool? value) {
              context.read<TodoListCubit>().updateTodo(
                    todo.copyWith(isDone: value),
                  );
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // use read to access the state
              context.read<TodoListCubit>().deleteTodo(todo);
            },
          ),
        );
      },
    );
  }
}
