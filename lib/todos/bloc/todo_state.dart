part of 'todo_bloc.dart';

@immutable
abstract class TodoState {
  const TodoState();
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  const TodoLoaded({required this.todos});

  final List<Todo> todos;
}
