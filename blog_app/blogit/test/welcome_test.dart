import 'package:flutter_test/flutter_test.dart';

import 'package:blogit/screens/welcome_screen.dart';

void main() {
  testWidgets('Test welcome page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WelcomeScreen());

    expect(find.text('Welcome to Blog It'), findsOneWidget);
    expect(find.text('Hello'), findsNothing);

    // Tap the LOGIN button and trigger a frame.
    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    // Tap the SIGN UP button and trigger a frame.
    await tester.tap(find.text('SIGN UP'));
    await tester.pump();
  });
}
