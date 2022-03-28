// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:blogit/main.dart';

void main() {
  testWidgets('Test homepage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Welcome to BlogIt'), findsOneWidget);
    expect(find.text('Hello'), findsNothing);

    // Tap the LOGIN button and trigger a frame.
    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    // Tap the SIGN UP button and trigger a frame.
    await tester.tap(find.text('SIGN UP'));
    await tester.pump();
  });
}
