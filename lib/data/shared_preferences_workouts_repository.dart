import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/domain/repositories/exercises_repository.dart';
import 'package:workout_tracker/domain/repositories/workouts_repository.dart';
import 'package:workout_tracker/utils/result.dart';

const _workoutsKey = 'workouts';

class SharedPreferencesWorkoutsRepository implements WorkoutsRepository {
  SharedPreferencesWorkoutsRepository(
      this._sharedPreferences, this._exercisesRepository);

  final SharedPreferencesAsync _sharedPreferences;
  final ExercisesRepository _exercisesRepository;

  @override
  Future<Result<List<Workout>>> getWorkouts() async {
    final exercisesResult = await _exercisesRepository.getExercises();
    if (exercisesResult is Failure<List<Exercise>>) {
      return Failure(error: exercisesResult.error);
    }
    final exercises = (exercisesResult as Success<List<Exercise>>).data;
    final workoutsJson = await _fetchWorkouts();
    return Success(workoutsJson.values
        .map((workoutJson) => _workoutFromJson(workoutJson, exercises))
        .toList());
  }

  @override
  Future<Result<void>> addWorkout(Workout workout) async {
    try {
      final workoutsJson = await _fetchWorkouts();
      workoutsJson[workout.id] = _workoutToJson(workout);
      await _sharedPreferences.setString(
          _workoutsKey, jsonEncode(workoutsJson));
      return Success(null);
    } on Exception catch (e) {
      return Failure(error: e);
    }
  }

  @override
  Future<Result<void>> deleteWorkout(String id) async {
    try {
      final workoutsJson = await _fetchWorkouts();
      workoutsJson.remove(id);
      await _sharedPreferences.setString(
          _workoutsKey, jsonEncode(workoutsJson));
      return Success(null);
    } on Exception catch (e) {
      return Failure(error: e);
    }
  }

  @override
  Future<Result<void>> updateWorkout(Workout workout) async {
    try {
      final workoutsJson = await _fetchWorkouts();
      workoutsJson[workout.id] = _workoutToJson(workout);
      await _sharedPreferences.setString(
          _workoutsKey, jsonEncode(workoutsJson));
      return Success(null);
    } on Exception catch (e) {
      return Failure(error: e);
    }
  }

  Future<Map<String, dynamic>> _fetchWorkouts() async {
    final workoutsJson = await _sharedPreferences.getString(_workoutsKey);
    return jsonDecode(workoutsJson ?? '{}') as Map<String, dynamic>;
  }

  Map<String, dynamic> _workoutToJson(Workout workout) {
    return {
      'id': workout.id,
      'name': workout.name,
      'sets': workout.sets
          .map((set) => {
                'exerciseId': set.exercise.id,
                'repetitions': set.repetitions,
                'weight': set.weight,
              })
          .toList(),
    };
  }

  Workout _workoutFromJson(
      Map<String, dynamic> json, List<Exercise> exercises) {
    return Workout(
      id: json['id'],
      name: json['name'],
      sets: (json['sets'] as List).map((setJson) {
        final exercise = exercises
            .firstWhere((exercise) => exercise.id == setJson['exerciseId']);
        return Set(
          exercise: exercise,
          repetitions: setJson['repetitions'],
          weight: setJson['weight'],
        );
      }).toList(),
    );
  }
}
