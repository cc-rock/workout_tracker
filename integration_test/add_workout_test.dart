import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:workout_tracker/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets(
    'Add a workout',
    (WidgetTester tester) async {
      // Initialing Application for Testing and waiting for it to launch
      app.main();

      await tester.pump(const Duration(seconds: 5));

      expect(find.text('My workouts'), findsOneWidget);

      await tester.tap(find.text('Add workout'));

      await tester.pumpAndSettle();

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Sets'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('nameField')), 'Workout 1');

      await tester.tap(find.text('  +  '));

      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('repetitionsField0')), '10');
      await tester.enterText(find.byKey(const Key('weightField0')), '100');

      await tester.tap(find.text('Save'));

      await tester.pumpAndSettle();

      expect(find.text('My workouts'), findsOneWidget);
      expect(find.text('Workout 1'), findsOneWidget);
      expect(find.text('N. of sets: 1'), findsOneWidget);
    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 5)),
  );
}
