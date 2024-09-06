import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workout_tracker/di.dart';
import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/my_workouts/my_workouts_cubit.dart';
import 'package:workout_tracker/screens/my_workouts/my_workouts_screen.dart';

class MockMyWorkoutsCubit extends Mock implements MyWorkoutsCubit {}

const _workouts = [
  Workout(id: '1', name: 'Workout 1', sets: [
    Set(exercise: Exercise(id: 'ex1', name: 'Deadlift'), repetitions: 10, weight: 10),
    Set(exercise: Exercise(id: 'ex1', name: 'Dumbell'), repetitions: 10, weight: 10),
  ]),
  Workout(id: '2', name: 'Workout 2', sets: [
    Set(exercise: Exercise(id: 'ex1', name: 'Deadlift'), repetitions: 10, weight: 10),
  ]),
];

void main() {
  late MockMyWorkoutsCubit cubit;

  late StreamController<MyWorkoutsViewState> streamController;

  setUp(() {
    cubit = MockMyWorkoutsCubit();
    streamController = StreamController<MyWorkoutsViewState>.broadcast();
    when(() => cubit.state).thenReturn(const MyWorkoutsViewState());
    when(() => cubit.stream).thenAnswer((_) => streamController.stream);
    when(() => cubit.loadWorkouts()).thenAnswer((_) async => {});
    when(() => cubit.onAddWorkoutPressed()).thenAnswer((_) async => {});
    when(() => cubit.onWorkoutSelected(_workouts[0])).thenAnswer((_) async => {});
    when(() => cubit.close()).thenAnswer((_) async => {});
    getIt.registerFactoryParam<MyWorkoutsCubit, MyWorkoutsNavigator, void>(
      (_, __) => cubit,
    );
  });

  tearDown(() {
    streamController.close();
    getIt.unregister<MyWorkoutsCubit>();
  });

  group('MyWorkousScreen', () {
    testWidgets('shows a loading spinner when receiving a loading state', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyWorkoutsScreen(),
      ));

      streamController.add(const MyWorkoutsViewState(isLoading: true));

      // pump and settle does not work here, because of the spinner animation
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows a list of workouts when receiving a state with workouts', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyWorkoutsScreen(),
      ));

      streamController.add(const MyWorkoutsViewState(workouts: _workouts));

      await tester.pumpAndSettle();

      expect(find.text('Workout 1'), findsOneWidget);
      expect(find.text('N. of sets: 2'), findsOneWidget);
      expect(find.text('Workout 2'), findsOneWidget);
      expect(find.text('N. of sets: 1'), findsOneWidget);
    });

    testWidgets('calls the correct cubit method when the add workout button is pressed', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyWorkoutsScreen(),
      ));

      streamController.add(const MyWorkoutsViewState(workouts: _workouts));

      await tester.pumpAndSettle();

      await tester.tap(find.text('Add workout'));

      verify(() => cubit.onAddWorkoutPressed()).called(1);
    });

    testWidgets('calls the correct cubit method when a workout is selected', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyWorkoutsScreen(),
      ));

      streamController.add(const MyWorkoutsViewState(workouts: _workouts));

      await tester.pumpAndSettle();

      await tester.tap(find.text('Workout 1'));

      verify(() => cubit.onWorkoutSelected(_workouts[0])).called(1);
    });
  });

}
