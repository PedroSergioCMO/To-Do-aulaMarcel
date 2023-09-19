import 'package:flutter/material.dart';
import 'package:todo_list/cadastro_screen.dart';
import 'package:todo_list/model/task.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<Task> _task = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-do",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _task.length,
          itemBuilder: (context, index) {
            Task task = _task[index];
            return ListTile(
              title: Text(
                task.texto,
                style: TextStyle(
                    color: task.done ? Colors.grey : Colors.black,
                    decoration: task.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              onTap: () {
                setState(() {
                  task.done = !task.done;
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Task? newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => cadastro_screen(),
            ),
          );
          if (newTask != null) {
            setState(() {
              _task.add(newTask);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
