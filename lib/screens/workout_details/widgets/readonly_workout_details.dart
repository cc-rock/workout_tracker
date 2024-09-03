import 'package:flutter/widgets.dart';
import 'package:workout_tracker/domain/models/workout.dart';

class ReadOnlyWorkoutDetails extends StatelessWidget {
  const ReadOnlyWorkoutDetails({super.key, required this.workout});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workout.name,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        for (final set in workout.sets)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                set.exercise.name,
                style: const TextStyle(fontSize: 18),
              ),
              Text('Repetitions: ${set.repetitions}'),
              Text('Weight: ${set.weight}'),
              const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }
}