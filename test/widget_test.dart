import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:firstly/main.dart';

void main() {
  testWidgets('Add task test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the list starts empty.
    expect(find.byType(ListTile), findsNothing);

    // Enter a task in the text field.
    await tester.enterText(find.byType(TextField), 'Task 1');

    // Tap the '+' icon to add the task.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the task is added to the list.
    expect(find.text('Task 1'), findsOneWidget);
  });
}
