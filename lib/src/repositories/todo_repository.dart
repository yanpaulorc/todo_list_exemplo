import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo_model.dart';

class TodoRepository {
  var url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodos() async {
    final response = await http.get(Uri.parse(url));
    final List list = jsonDecode(response.body);
    List<TodoModel> todos = [];
    for (var json in list) {
      final todo = TodoModel.fromMap(json);
      todos.add(todo);
    }
    return todos;
  }
}
