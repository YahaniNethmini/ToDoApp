import 'package:flutter/material.dart';
import 'package:todoapp/screens/home_page.dart'; // Ensure this path is correct

void main() {
  runApp(const ToDoApp()); // Add const for better performance in Flutter 3.x+
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Add const here for the HomePage instance
    );
  }
}
