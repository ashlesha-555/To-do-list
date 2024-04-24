import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> todos = [];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter your task',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
                contentPadding: EdgeInsets.all(16.0),
              ),
              onSubmitted: (value) {
                addTodo();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  color: Colors.teal.withOpacity(0.1),
                  child: ListTile(
                    title: Text(
                      todos[index],
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteTodo(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  void addTodo() {
    String todo = controller.text;
    if (todo.isNotEmpty) {
      setState(() {
        todos.add(todo);
        controller.clear();
      });
    }
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
