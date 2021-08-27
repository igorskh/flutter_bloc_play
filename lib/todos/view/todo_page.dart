import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import 'todo_add_bottom_sheet.dart';
import 'todo_view.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key) {
    _todoBloc.add(TodoGet());
  }

  final _todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _todoBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todos'),
        ),
        body: TodoView(todoBloc: _todoBloc),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return TodoAddBottomSheet(
                  todoBloc: _todoBloc,
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
