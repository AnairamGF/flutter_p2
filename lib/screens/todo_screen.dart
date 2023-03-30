import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todoList = [];

  void _addItem(String item) {
    setState(() {
      _todoList.add(item);
    });
  }

  void _removeItem(String item) {
    setState(() {
      _todoList.remove(item);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (context, int index) {
        final todoItem = _todoList[index];
        return ListTile(
          title: Text(todoItem),
          trailing: IconButton(
              onPressed: () => _removeItem(todoItem), icon: Icon(Icons.delete)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do List"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Agregue una nueva tarea",
            ),
            onSubmitted: ((value) {
              _addItem(value);
            }),
          ),
          Expanded(child: _buildTodoList())
        ],
      ),
    );
  }
}
