import 'package:blogit/screens/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing home page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HomeScreen());

    expect(find.text('Home'), findsOneWidget);

  });
}
