import 'package:counter_bloc/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const appWidget = const MaterialApp(home: CounterScreen());

void main() {
  const resultKey = Key('counterView_result');
  const incKey = Key('counterView_increment');
  const decKey = Key('counterView_decrement');

  testWidgets('Counter increments', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(appWidget);

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
    await tester.pumpWidget(appWidget);

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byKey(decKey));
    await tester.pump();

    expect(find.text('1'), findsNothing);
    expect(find.text('-1'), findsOneWidget);
  });

  testWidgets('Counter resets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(appWidget);

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
