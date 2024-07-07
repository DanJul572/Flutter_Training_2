import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onAdd});

  final void Function(BuildContext context) onAdd;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          onAdd(context);
        },
        iconSize: 40,
        icon: const Icon(Icons.add),
        color: Colors.deepOrange,
        tooltip: 'Add Task',
      ),
    );
  }
}
