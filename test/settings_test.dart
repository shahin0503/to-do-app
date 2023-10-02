import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notjusttodoapp/provider/theme_provider.dart';
import 'package:notjusttodoapp/views/settings_view.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('SettingsView toggles theme', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MaterialApp(
          home: Scaffold( 
            body: SettingsView(),
          ),
        ),
      ),
    );

    final switchWidget = find.byType(Switch);

    expect(tester.widget<Switch>(switchWidget).value, isTrue);

    await tester.tap(switchWidget);

    await tester.pump();

    expect(tester.widget<Switch>(switchWidget).value, isFalse);
  });
}
