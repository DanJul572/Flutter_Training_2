import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zapp/screen/home/home.screen.dart';

void main() {
  testWidgets('Close Form', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Add Task'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.cancel));
    await tester.pump();

    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('Run Form Validation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      )
    ));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Add Task'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.save));
    await tester.pump();

    expect(find.text('All fields are required'), findsOneWidget);
  });

  testWidgets('Save and Delete Task', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Add Task'), findsOneWidget);

    Finder titleField = find.byKey(const Key('title_field'));
    expect(titleField, findsOneWidget);

    Finder descriptionField = find.byKey(const Key('description_field'));
    expect(descriptionField, findsOneWidget);

    await tester.enterText(titleField, 'Title 1');
    await tester.enterText(descriptionField, 'Description 1');

    await tester.tap(find.byIcon(Icons.save));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(AlertDialog), findsNothing);
    expect(find.text('Title 1'), findsOneWidget);
    expect(find.text('Description 1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(find.text('Title 1'), findsNothing);
    expect(find.text('Task is empty'), findsOneWidget);
  });
}
