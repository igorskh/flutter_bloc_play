// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:counter_bloc/app.dart';

void main() {
  const resultKey = Key('counterView_result');
  const incKey = Key('counterView_increment');
  const decKey = Key('counterView_decrement');

  testWidgets('Counter increments', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(PlayWithBlocApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter decrements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(PlayWithBlocApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(
        find.byKey(decKey)
    );
    await tester.pump();

    expect(find.text('1'), findsNothing);
    expect(find.text('-1'), findsOneWidget);
  });

  testWidgets('Counter resets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(PlayWithBlocApp());

    await tester.tap(find.byKey(resultKey));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(decKey));
    await tester.tap(find.byKey(incKey));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(resultKey));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}
