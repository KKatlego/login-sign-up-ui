import 'package:blogit/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Test login page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LoginScreen());

    expect(find.text('Login'), findsOneWidget);


    // Tap the LOGIN button and trigger a frame.
    await tester.tap(find.text('LOGIN'));
    await tester.pump();
  });
}
