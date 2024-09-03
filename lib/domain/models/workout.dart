import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_tracker/domain/models/exercise.dart';

part 'workout.freezed.dart';

@freezed
class Set with _$Set {
  const factory Set({
    required Exercise exercise,
    required int repetitions,
    required int weight,
  }) = _Set;
}

@freezed
class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String name,
    required List<Set> sets,
  }) = _Workout;
}
