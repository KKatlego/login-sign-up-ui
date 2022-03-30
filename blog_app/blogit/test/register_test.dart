import 'package:blogit/screens/register_screen.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Test registration page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RegisterScreen());

    expect(find.text('Register'), findsOneWidget);


    // Tap the SIGN UP button and trigger a frame.
    await tester.tap(find.text('SIGN UP'));
    await tester.pump();
  });
}
