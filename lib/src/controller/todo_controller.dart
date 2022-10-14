import 'package:flutter_todo_list/src/repositories/todo_repository.dart';

import '../models/todo_model.dart';

class TodoController {
  final _repository = TodoRepository();

  Future<List<TodoModel>> fetch() async {
    return await _repository.fetchTodos();
  }
}
