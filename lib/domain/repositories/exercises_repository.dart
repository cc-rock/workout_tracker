import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/utils/result.dart';

abstract class ExercisesRepository {
  Future<Result<List<Exercise>>> getExercises();

  Future<Result<Exercise>> getExerciseById(String id);
}
