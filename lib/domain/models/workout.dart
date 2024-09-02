import 'package:workout_tracker/domain/models/exercise.dart';

class Set {
  const Set({required this.exercise, required this.repetitions, required this.weight});
  
  final Exercise exercise;
  final int repetitions;
  final int weight;
}

class Workout {
  const Workout({required this.id, required this.name, required this.sets});
  
  final String id;
  final String name;
  final List<Set> sets;
}

