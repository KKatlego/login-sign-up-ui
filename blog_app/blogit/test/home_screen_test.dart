import 'package:blogit/screens/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing home page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HomeScreen());

    expect(find.text('Home'), findsOneWidget);


    // Tap the SIGN UP button and trigger a frame.
    await tester.tap(find.text('LOGOUT'));
    await tester.pump();
  });
}
