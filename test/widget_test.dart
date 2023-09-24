// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

<<<<<<< HEAD

import 'package:project_uts/screens/Profile.dart';
import 'package:project_uts/screens/log_in.dart';
=======
import 'package:project_uts/main.dart';
>>>>>>> 76a13b61e2a749edf48dde56dddee74cfe7030ff

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
<<<<<<< HEAD
    await tester.pumpWidget(const Profile());
    await tester.pumpWidget(const LogIn());
=======
    await tester.pumpWidget(const MyApp());
>>>>>>> 76a13b61e2a749edf48dde56dddee74cfe7030ff

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
}
