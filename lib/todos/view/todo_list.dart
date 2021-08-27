import 'package:flutter/material.dart';

import '../bloc/todo_bloc.dart';
import '../model/todo.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key, required List<Todo> items, required TodoBloc todoBloc})
      : _todoBloc = todoBloc,
        _items = items,
        super(key: key);

  final TodoBloc _todoBloc;
  final List<Todo> _items;

  void _deleteTodo(int id) {
    _todoBloc.add(TodoDelete(todoID: id));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _deleteTodo(_items[index].id!),
          child: ListTile(
            title: Text('${_items[index].id!}: ${_items[index].description}'),
          ),
        );
      },
      itemCount: _items.length,
    );
  }
}
