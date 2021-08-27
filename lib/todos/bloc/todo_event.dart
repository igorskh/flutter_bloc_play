part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {
  const TodoEvent();
}

class TodoGet extends TodoEvent {}

class TodoAdd extends TodoEvent {
  const TodoAdd({required this.todo});

  final Todo todo;
}

class TodoUpdate extends TodoEvent {
  const TodoUpdate({required this.todo});

  final Todo todo;
}

class TodoDelete extends TodoEvent {
  const TodoDelete({required this.todoID});

  final int todoID;
}
