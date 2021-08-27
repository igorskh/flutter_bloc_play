import 'package:counter_bloc/todos/bloc/todo_bloc.dart';
import 'package:counter_bloc/todos/model/todo.dart';
import 'package:counter_bloc/todos/view/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: Text('Add'),
        ),
      ),
    );
  }
}

class TodoAddBottomSheet extends StatefulWidget {
  TodoAddBottomSheet({Key? key, required TodoBloc todoBloc})
      : _todoBloc = todoBloc,
        super(key: key);

  final TodoBloc _todoBloc;

  @override
  _TodoAddBottomSheetState createState() => _TodoAddBottomSheetState();
}

class _TodoAddBottomSheetState extends State<TodoAddBottomSheet> {
  final _descriptionTextController = TextEditingController();

  void _addTodo() {
    var todo = Todo(description: _descriptionTextController.text);
    widget._todoBloc.add(TodoAdd(todo: todo));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _descriptionTextController,
                enabled: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: _addTodo,
                ),
                ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
