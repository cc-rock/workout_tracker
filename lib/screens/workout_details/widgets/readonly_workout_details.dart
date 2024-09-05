import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_cubit.dart';

class ReadOnlyWorkoutDetails extends StatelessWidget {
  const ReadOnlyWorkoutDetails({super.key, required this.workout});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Name',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            workout.name,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          const Text(
            'Sets',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                for (final set in workout.sets)
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Expanded(
                        flex: 5,
                        child: Text(
                          set.exercise.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '${set.repetitions} reps',
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${set.weight} Kg',
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: context.read<WorkoutDetailsCubit>().onEditWorkout,
                  child: const Text('Edit'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
