import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_cubit.dart';

class EditableWorkoutDetails extends StatelessWidget {
  const EditableWorkoutDetails(
      {super.key, required this.workout, required this.availableExercises});

  final Workout workout;
  final List<Exercise> availableExercises;

  @override
  Widget build(BuildContext context) {
    final sets = workout.sets;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: workout.name,
          decoration: const InputDecoration(
            labelText: 'Workout name',
          ),
          onChanged: (value) =>
              context.read<WorkoutDetailsCubit>().onNameChanged(value),
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < sets.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<Exercise>(
                value: sets[i].exercise,
                items: availableExercises
                    .map((exercise) => DropdownMenuItem(
                          value: exercise,
                          child: Text(exercise.name),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<WorkoutDetailsCubit>()
                        .onSetExerciseChanged(i, value);
                  }
                },
              ),
              TextFormField(
                initialValue: sets[i].repetitions.toString(),
                decoration: const InputDecoration(
                  labelText: 'Repetitions',
                ),
                onChanged: (value) => context
                    .read<WorkoutDetailsCubit>()
                    .onSetRepetitionsChanged(i, int.tryParse(value) ?? 0),
              ),
              TextFormField(
                initialValue: sets[i].weight.toString(),
                decoration: const InputDecoration(
                  labelText: 'Weight',
                ),
                onChanged: (value) => context
                    .read<WorkoutDetailsCubit>()
                    .onSetWeightChanged(i, int.tryParse(value) ?? 0),
              ),
              const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }
}
