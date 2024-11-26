import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_counter/page/halaman1Page.dart';
import 'package:flutter_application_counter/bloc/bloc_bloc.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => bloc_bloc(),
        child: const MaterialApp(
          home: Halaman1Page(),
        ),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('Total: 0'), findsOneWidget);
    expect(find.text('Total: 1'), findsNothing);

    // Enter a number and tap "Tambah" button
    await tester.enterText(find.byType(TextField), '5');
    await tester.tap(find.text('Tambah'));
    await tester.pump();

    // Verify that the counter has incremented
    expect(find.text('Total: 0'), findsNothing);
    expect(find.text('Total: 5'), findsOneWidget);
  });
}
