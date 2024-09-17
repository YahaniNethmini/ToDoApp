import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction, // Made this parameter optional
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final void Function(BuildContext)? deleteFunction; // Updated signature

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                print("Task deleted: $taskName"); // Print statement for delete action
                if (deleteFunction != null) {
                  deleteFunction!(context);
                }
              },
              icon: Icons.delete,
              backgroundColor: Colors.white, // Set background color
              foregroundColor: Colors.orange, // Set icon color
              label: 'Delete', // Optional label
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: (value) {
                  print("Checkbox changed for task: $taskName, New value: $value"); // Print statement for checkbox change
                  if (onChanged != null) {
                    onChanged!(value);
                  }
                },
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough // Strike-through if completed
                      : TextDecoration.none, // No decoration if not completed
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
