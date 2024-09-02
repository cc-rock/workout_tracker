import 'package:collection/collection.dart';
import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/domain/repositories/exercises_repository.dart';
import 'package:workout_tracker/utils/result.dart';

class HardcodedExercisesRepository implements ExercisesRepository {
  
  static const _exercises = [
    Exercise(id: '1', name: 'Bench Press'),
    Exercise(id: '2', name: 'Squat'),
    Exercise(id: '3', name: 'Deadlift'),
  ];

  @override
  Future<Result<List<Exercise>>> getExercises() async {
    return Success(_exercises);
  }
  
  @override
  Future<Result<Exercise>> getExerciseById(String id) async {
    final exercise = _exercises.firstWhereOrNull((exercise) => exercise.id == id);
    if (exercise == null) {
      return Failure(error: 'Exercise not found');
    }
    return Success(exercise);
  }
}