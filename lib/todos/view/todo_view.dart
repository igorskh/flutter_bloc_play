import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import 'todo_list.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key, required TodoBloc todoBloc})
      : _todoBloc = todoBloc,
        super(key: key);

  final TodoBloc _todoBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      bloc: _todoBloc,
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              if (state is TodoInitial)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CircularProgressIndicator(),
                ),
              if (state is TodoLoaded)
                Flexible(
                  child: TodoList(
                    items: state.todos,
                    todoBloc: _todoBloc,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
