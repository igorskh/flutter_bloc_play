import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/todo.dart';
import '../repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial());

  final _todoRepository = TodoRepository();

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is TodoGet) {
      yield await _todoGetToState(state);
    } else if (event is TodoAdd) {
      yield await _todoAddToState(event.todo, state);
    } else if (event is TodoUpdate) {
      yield await _todoUpdateToState(event.todo, state);
    } else if (event is TodoDelete) {
      yield await _todoDeleteToState(event.todoID, state);
    }
  }

  Future<TodoState> _todoGetToState(TodoState state) async {
    var todos = await _todoRepository.getAllTodos();

    return TodoLoaded(todos: todos);
  }

  Future<TodoState> _todoAddToState(Todo todo, TodoState state) async {
    await _todoRepository.insertTodo(todo);
    return await _todoGetToState(state);
  }

  Future<TodoState> _todoUpdateToState(Todo todo, TodoState state) async {
    await _todoRepository.updateTodo(todo);
    return await _todoGetToState(state);
  }

  Future<TodoState> _todoDeleteToState(int todoID, TodoState state) async {
    await _todoRepository.deleteTodoById(todoID);
    return await _todoGetToState(state);
  }
}
