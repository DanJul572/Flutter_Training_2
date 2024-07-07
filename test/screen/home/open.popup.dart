import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zapp/screen/home/home.screen.dart';

void main() {
  testWidgets('Open and close task form', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));

    // Verify if IconButton is present
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap the IconButton
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Rebuild the widget after the state has changed

    // Verify if AlertDialog is shown
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Add Task'), findsOneWidget);

    // Tap the 'OK' button to close the dialog
    await tester.tap(find.byIcon(Icons.cancel));
    await tester.pump(); // Rebuild the widget after the state has changed

    // Verify if AlertDialog is dismissed
    expect(find.byType(AlertDialog), findsNothing);
  });
}
