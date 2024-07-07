import 'package:flutter/material.dart';
import 'package:zapp/screen/home/component/add.button.dart';
import 'package:zapp/screen/home/component/popup.form.dart';
import 'package:zapp/screen/home/component/task.list.dart';
import 'package:zapp/screen/home/type/task.type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Task> tasks = [];

  void onAdd(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopupForm(
          onCreate: onCreate
        ); // Use your custom form widget here
      },
    );
  }

  void onCreate(String title, String description) {
    setState(() {
      tasks.add(Task(title: title, description: description));
    });
  }

  void onDelete(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenWidgets = [
      AddButton(onAdd: onAdd),
      TaskList(
        tasks: tasks,
        onDelete: onDelete,
      ),
    ];

    return Column(
      children: childrenWidgets,
    );
  }
}
