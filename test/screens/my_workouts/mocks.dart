import 'package:mocktail/mocktail.dart';
import 'package:workout_tracker/domain/repositories/workouts_repository.dart';
import 'package:workout_tracker/screens/my_workouts/my_workouts_cubit.dart';

class MockWorkoutsRepository extends Mock implements WorkoutsRepository {}

class MockMyWorkoutsNavigator extends Mock implements MyWorkoutsNavigator {}