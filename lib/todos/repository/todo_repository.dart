import '../database/todo_dao.dart';
import '../model/todo.dart';

class TodoRepository {
  final todoDao = TodoDao();

  Future<List<Todo>> getAllTodos() => todoDao.getTodos();

  Future<int> insertTodo(Todo todo) => todoDao.createTodo(todo);

  Future<int> updateTodo(Todo todo) => todoDao.updateTodo(todo);

  Future<int> deleteTodoById(int id) => todoDao.deleteTodo(id);

  //We are not going to use this in the demo
  Future deleteAllTodos() => todoDao.deleteAllTodos();
}
