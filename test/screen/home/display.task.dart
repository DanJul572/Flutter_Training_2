import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zapp/screen/home/component/task.list.dart';
import 'package:zapp/screen/home/type/task.type.dart';

void main() {
  testWidgets('TaskList Widget displays tasks correctly', (WidgetTester tester) async {
    final List<Task> tasks = [
      Task(title: 'Task 1', description: 'Description 1'),
      Task(title: 'Task 2', description: 'Description 2'),
    ];

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TaskList(tasks: tasks),
          ],
        )
      )
    ));

    // Verify if initial task list is displayed
    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Description 1'), findsOneWidget);
    expect(find.text('Task 2'), findsOneWidget);
    expect(find.text('Description 2'), findsOneWidget);
  });
}
