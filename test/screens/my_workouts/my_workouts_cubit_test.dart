import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/domain/repositories/workouts_repository.dart';
import 'package:workout_tracker/screens/my_workouts/my_workouts_cubit.dart';
import 'package:workout_tracker/utils/result.dart';

class MockWorkoutsRepository extends Mock implements WorkoutsRepository {}

class MockMyWorkoutsNavigator extends Mock implements MyWorkoutsNavigator {}

const _workouts = [
  Workout(id: '1', name: 'Workout 1', sets: []),
  Workout(id: '2', name: 'Workout 2', sets: []),
];

void main() {
  late MockWorkoutsRepository workoutsRepository;
  late MockMyWorkoutsNavigator navigator;
  late MyWorkoutsCubit cubit;

  List<MyWorkoutsViewState> states = [];

  setUp(() {
    states.clear();
    workoutsRepository = MockWorkoutsRepository();
    navigator = MockMyWorkoutsNavigator();
    when(() => workoutsRepository.getWorkouts()).thenAnswer((_) async => Success(_workouts));
    when(() => navigator.showErrorMessage(any())).thenAnswer((_) async {});
    cubit = MyWorkoutsCubit(workoutsRepository, navigator);
    cubit.stream.listen((state) => states.add(state));
  });

  group('MyWorkoutsCubit.loadWorkouts', () {
    test('should load workouts', () async {
      await cubit.loadWorkouts();
      verify(() => workoutsRepository.getWorkouts()).called(1);
    });

    test('should emit loading state, then the workouts list, when the repository call succeeds', () async {
      await cubit.loadWorkouts();

      // Blocs emit states asynchronously, so we wait to ensure all states are emitted
      await pumpEventQueue();

      expect(
        states,
        [
          const MyWorkoutsViewState(isLoading: true),
          const MyWorkoutsViewState(workouts: _workouts, isLoading: false),
        ],
      );
    });

    test('should stop loading when the repository call fails', () async {
      when(() => workoutsRepository.getWorkouts()).thenAnswer((_) async => Failure(error: 'Error'));
      await cubit.loadWorkouts();
      await pumpEventQueue();
      expect(
        states,
        [
          const MyWorkoutsViewState(isLoading: true),
          const MyWorkoutsViewState(isLoading: false),
        ],
      );
    });

    test('should show an error message when the repository call fails', () async {
      when(() => workoutsRepository.getWorkouts()).thenAnswer((_) async => Failure(error: 'Error'));
      await cubit.loadWorkouts();
      verify(() => navigator.showErrorMessage('Error')).called(1);
    });
  });

  group('MyWorkoutsCubit.onWorkoutSelected', () {
    test('should navigate to the workout details screen', () async {
      when(() => navigator.goToWorkoutDetails(_workouts[0])).thenAnswer((_) async => false);
      await cubit.loadWorkouts();
      await cubit.onWorkoutSelected(_workouts[0]);
      verify(() => navigator.goToWorkoutDetails(_workouts[0])).called(1);
    });

    test('should reload the workouts on returning, when the navigator returns true', () async {
      when(() => navigator.goToWorkoutDetails(_workouts[0])).thenAnswer((_) async => true);

      await cubit.onWorkoutSelected(_workouts[0]);
      verify(() => workoutsRepository.getWorkouts()).called(1);
    });

    test('should not reload the workouts on returning, when the navigator returns false', () async {
      when(() => navigator.goToWorkoutDetails(_workouts[0])).thenAnswer((_) async => false);

      await cubit.onWorkoutSelected(_workouts[0]);
      verifyNever(() => workoutsRepository.getWorkouts());
    });
  });

  group('MyWorkoutsCubit.onAddWorkoutPressed', () {
    test('should navigate to the workout details screen in add mode', () async {
      when(() => navigator.goToAddWorkout()).thenAnswer((_) async => false);

      await cubit.onAddWorkoutPressed();
      verify(() => navigator.goToAddWorkout()).called(1);
    });

    test('should reload the workouts on returning, when the navigator returns true', () async {
      when(() => navigator.goToAddWorkout()).thenAnswer((_) async => true);

      await cubit.onAddWorkoutPressed();
      verify(() => workoutsRepository.getWorkouts()).called(1);
    });

    test('should not reload the workouts on returning, when the navigator returns false', () async {
      when(() => navigator.goToAddWorkout()).thenAnswer((_) async => false);

      await cubit.onAddWorkoutPressed();
      verifyNever(() => workoutsRepository.getWorkouts());
    });
  });

  group('MyWorkoutsCubit.onDeleteWorkoutPressed', () {
    test('should show a confirmation dialog', () async {
      when(() => navigator.showConfirmationMessage(title: any(named: 'title'), message: any(named: 'message')))
          .thenAnswer((_) async => false);
      await cubit.onDeleteWorkoutPressed(_workouts[0]);
      verify(() => navigator.showConfirmationMessage(title: 'Confirmation', message: 'Delete workout Workout 1?'))
          .called(1);
    });

    test('should not delete the workout when the user cancels the confirmation dialog', () async {
      when(() => navigator.showConfirmationMessage(title: any(named: 'title'), message: any(named: 'message')))
          .thenAnswer((_) async => false);
      await cubit.onDeleteWorkoutPressed(_workouts[0]);
      verifyNever(() => workoutsRepository.deleteWorkout(_workouts[0].id));
    });

    test('should delete the workout when the user confirms the confirmation dialog', () async {
      when(() => navigator.showConfirmationMessage(title: any(named: 'title'), message: any(named: 'message')))
          .thenAnswer((_) async => true);
      when(() => workoutsRepository.deleteWorkout(_workouts[0].id)).thenAnswer((_) async => Success(null));    
      await cubit.onDeleteWorkoutPressed(_workouts[0]);
      verify(() => workoutsRepository.deleteWorkout(_workouts[0].id)).called(1);
    });

    test('should show an error message when the repository call fails', () async {
      when(() => navigator.showConfirmationMessage(title: any(named: 'title'), message: any(named: 'message')))
          .thenAnswer((_) async => true);
      when(() => workoutsRepository.deleteWorkout(_workouts[0].id)).thenAnswer((_) async => Failure(error: 'Error'));
      await cubit.onDeleteWorkoutPressed(_workouts[0]);
      verify(() => navigator.showErrorMessage('Error')).called(1);
    });

    test('should not reload the workouts when the repository call fails', () async {
      when(() => navigator.showConfirmationMessage(title: any(named: 'title'), message: any(named: 'message')))
          .thenAnswer((_) async => true);
      when(() => workoutsRepository.deleteWorkout(_workouts[0].id)).thenAnswer((_) async => Failure(error: 'Error'));
      await cubit.onDeleteWorkoutPressed(_workouts[0]);
      verifyNever(() => workoutsRepository.getWorkouts());
    });

    test('should reload the workouts when the repository call succeeds', () async {
      when(() => navigator.showConfirmationMessage(title: any(named: 'title'), message: any(named: 'message')))
          .thenAnswer((_) async => true);
      when(() => workoutsRepository.deleteWorkout(_workouts[0].id)).thenAnswer((_) async => Success(null));
      await cubit.onDeleteWorkoutPressed(_workouts[0]);
      verify(() => workoutsRepository.getWorkouts()).called(1);
    });
  });
}
