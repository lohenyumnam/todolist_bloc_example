import 'package:bloc_example/src/todo/data/model/todo.model.dart';
import 'package:bloc_example/src/todo/logic/logic.dart';
import 'package:bloc_example/src/todo/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: const TodoListView(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Add'),
        onPressed: () {
          final todoListCubit = context.read<TodoListCubit>();
          final newTodoModel = TodoModel(
            id: '${DateTime.now().millisecondsSinceEpoch}',
            title: 'New Todo',
          );

          todoListCubit.addTodo(newTodoModel);
        },
      ),
    );
  }
}
