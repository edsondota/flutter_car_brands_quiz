import 'package:flutter_car_brands_quiz/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'When start the app should show the start game button',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      final buttonFinder = find.text('GET STARTED');

      expect(buttonFinder, findsOneWidget);
    },
  );
}
