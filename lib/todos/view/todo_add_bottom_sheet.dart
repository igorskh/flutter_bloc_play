import 'package:flutter/material.dart';

import '../bloc/todo_bloc.dart';
import '../model/todo.dart';

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
    if (_descriptionTextController.text.isEmpty) {
      return;
    }
    var todo = Todo(description: _descriptionTextController.text);
    widget._todoBloc.add(TodoAdd(todo: todo));
    Navigator.pop(context);
  }

  String? _validateDescription() {
    if (_descriptionTextController.text.isEmpty) {
      return "Description cannot be empty";
    }
    return null;
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
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _descriptionTextController,
                enabled: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  errorText: _validateDescription(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Icon(Icons.add),
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
