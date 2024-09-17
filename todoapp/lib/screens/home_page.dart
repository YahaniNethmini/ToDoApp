import 'package:flutter/material.dart';
import 'package:todoapp/utils/todo_list.dart'; // Make sure the path is correct

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ["Learn Web Development", false],
    ["Drink Coffee", false],
  ];

  // Method to handle checkbox state change
  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void savedNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      print("New task added: ${_controller.text}"); // Print statement
      _controller.clear(); // This will clear the text but hint text should remain
    });
  }

  void deleteTask(int index){
    setState(() {
      print("Task deleted: ${toDoList[index][0]}"); // Print statement
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: const Text(
          "To Do App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (value) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Add a new task here...",
                    filled: true,
                    fillColor: Colors.orange[100],
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.orange,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: savedNewTask,
              backgroundColor: Colors.white, // Set background color to white
              foregroundColor: Colors.orange, // Set icon color to orange
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
