import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_app/features/todo/data/model/todo_model.dart';

abstract class TodoFirestoreDatasource {
  Future<void> addTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo, String id);
  Future<void> deleteTodo(String id);
  Stream<QuerySnapshot<TodoModel>> getTodo();
}
