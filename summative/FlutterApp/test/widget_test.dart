import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

void main() {
  testWidgets('HomeScreen has a title and message',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final titleFinder = find.text('Welcome to Flutter');
    final messageFinder = find.text('This is the home screen.');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
