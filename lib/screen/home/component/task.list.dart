import 'package:flutter/material.dart';
import 'package:zapp/screen/home/component/task.card.dart';
import 'package:zapp/screen/home/type/task.type.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
    this.onDelete,
  });

  final List<Task> tasks;
  final void Function(int index)? onDelete;

  void handleDelete(int index) {
    if (onDelete != null) {
      onDelete!(index);
    }
  }

  Widget content() {
    if (tasks.isEmpty) {
      return const Text('Task is empty');
    }

    return Flexible( // Use Flexible here
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskCard(
            index: index,
            title: tasks[index].title,
            description: tasks[index].description,
            onDelete: handleDelete,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return content();
  }
}
