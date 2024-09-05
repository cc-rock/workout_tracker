import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/utils/result.dart';

abstract class WorkoutsRepository {
  Future<Result<List<Workout>>> getWorkouts();
  Future<Result<void>> addWorkout(Workout workout);
  Future<Result<void>> updateWorkout(Workout workout);
  Future<Result<void>> deleteWorkout(String id);
}
