import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notjusttodoapp/main.dart';
import 'package:notjusttodoapp/provider/theme_provider.dart';

void main() {
  testWidgets('App Integration Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyApp()));
    // Wait for the app to fully load
    await tester.pumpAndSettle();

    // Verify the initial UI: Check if the 'No tasks to display' text is visible
    expect(find.text('No tasks to display'), findsOneWidget);

    // Tap on the '+' button to add a new task
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Enter task details in the Add Task dialog
    await tester.enterText(find.byType(TextField).first, 'New Task');
    await tester.enterText(find.byType(TextField).at(1), 'Task Description');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Verify if the newly added task is displayed
    expect(find.text('New Task'), findsOneWidget);
    expect(find.text('Task Description'), findsOneWidget);

    // Tap on the filter button
    await tester.tap(find.byIcon(Icons.filter_alt_outlined));
    await tester.pumpAndSettle();

    // Check the 'Work' category filter
    await tester.tap(find.text('Work'));
    await tester.pumpAndSettle();

    // Verify if the task with 'Work' category is displayed
    expect(find.text('New Task'), findsOneWidget);
    expect(find.text('Task Description'), findsOneWidget);

    // Tap on the task to edit
    await tester.tap(find.text('New Task'));
    await tester.pumpAndSettle();

    // Verify if the Edit Task dialog is displayed
    expect(find.text('Edit Task'), findsOneWidget);

    // Close the Edit Task dialog
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    // Toggle dark mode in settings
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    // Verify if the theme is toggled to dark mode
    expect(ThemeProvider().isDarkMode, true);
  });
}
