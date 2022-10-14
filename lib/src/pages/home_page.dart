import 'package:flutter/material.dart';
import 'package:flutter_todo_list/src/controller/todo_controller.dart';

import '../models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TodoController controller = TodoController();
  Future<List<TodoModel>>? todos;

  @override
  void initState() {
    super.initState();
    todos = controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List exemplo'),
      ),
      body: FutureBuilder<List<TodoModel>>(
        future: todos,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final TodoModel todo = snapshot.data![index];
              final snackBar = SnackBar(
                content: Text('ID: ${todo.id}'),
                action: SnackBarAction(
                  disabledTextColor: Colors.white,
                  label: 'Voltar',
                  onPressed: () {},
                ),
              );
              return GestureDetector(
                child: Card(
                  child: ListTile(
                    leading: Text('${todo.id}'),
                    title: Text(todo.title),
                    subtitle: Text('${todo.completed}'),
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              );
            },
          );
        },
      ),
    );
  }
}
