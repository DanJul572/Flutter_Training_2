import 'package:flutter/material.dart';
import 'package:zapp/screen/home/component/task.card.dart';
import 'package:zapp/screen/home/type/task.type.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
    required this.onDelete
  });

  final List<Task> tasks;

  final void Function(int index) onDelete;

  Widget content () {
    if (tasks.isEmpty) {
      return const Text('Task is empty');
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          index: index,
          title: tasks[index].title,
          description: tasks[index].description,
          onDelete: onDelete,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: content(),
      ),
    );
  }
}
