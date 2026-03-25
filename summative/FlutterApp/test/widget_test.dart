import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets('App renders predictor UI', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentPredictorApp());

    final titleFinder = find.text('Student Performance Predictor');
    final buttonFinder = find.text('PREDICT NOW');
    final statusFinder = find.text('Ready to Predict');

    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(statusFinder, findsOneWidget);
  });
}
