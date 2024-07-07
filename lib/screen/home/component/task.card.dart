import 'package:flutter/material.dart';

TextStyle textStyle = const TextStyle(
    color: Colors.white
);

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.index,
    required this.title,
    required this.description,
    required this.onDelete
  });

  final int index;
  final String title;
  final String description;

  final void Function(int index) onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textScaler: const TextScaler.linear(1.5),
                  style: textStyle,
                ),
                Text(description, style: textStyle)
              ],
            ),
            IconButton(
              color: Colors.deepOrange,
              onPressed: () {
                onDelete(index);
              },
              icon: const Icon(Icons.delete)
            )
          ],
        )
      ),
    );
  }
}
