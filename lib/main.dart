import 'package:flutter/material.dart';

import 'data/todo_data.dart';
import 'models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Todo> todos;
  bool completed = false;

  @override
  void initState() {
    super.initState();
    todos = allTodos;
  }

  @override
  Widget build(BuildContext context) {
    // Return items that have a search term in the title
    // String query = "dinner";
    // List<Todo> todoList = todos.where((todo) => todo.title.toLowerCase().contains(query)).toList();

    // Return items that are not completed
    List<Todo> todoList =
        completed ? todos.where((todo) => !todo.completed).toList() : todos;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Icon(todoList[index].completed
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank),
                Text(todoList[index].title),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            completed = !completed;
          });
        },
        child: Icon(completed ? Icons.check_box_outline_blank : Icons.list),
      ),
    );
  }
}
