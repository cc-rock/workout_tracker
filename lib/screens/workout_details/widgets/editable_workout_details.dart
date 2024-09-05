import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_cubit.dart';

class EditableWorkoutDetails extends StatelessWidget {
  const EditableWorkoutDetails({super.key, required this.workout, required this.availableExercises});

  final Workout workout;
  final List<Exercise> availableExercises;

  @override
  Widget build(BuildContext context) {
    final sets = workout.sets;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Name',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            initialValue: workout.name,
            style: const TextStyle(fontSize: 24),
            onChanged: (value) => context.read<WorkoutDetailsCubit>().onNameChanged(value),
          ),
          const SizedBox(height: 16),
          const Text(
            'Sets',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < sets.length; i++)
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<WorkoutDetailsCubit>().onRemoveSet(i);
                          },
                        ),
                        Expanded(
                          flex: 5,
                          child: DropdownButtonFormField<Exercise>(
                            value: sets[i].exercise,
                            items: availableExercises
                                .map((exercise) => DropdownMenuItem(
                                      value: exercise,
                                      child: Text(
                                        exercise.name,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                context.read<WorkoutDetailsCubit>().onSetExerciseChanged(i, value);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: sets[i].repetitions.toString(),
                                  onChanged: (value) => context
                                      .read<WorkoutDetailsCubit>()
                                      .onSetRepetitionsChanged(i, int.tryParse(value) ?? 0),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text('reps'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: sets[i].weight.toString(),
                                  onChanged: (value) => context
                                      .read<WorkoutDetailsCubit>()
                                      .onSetWeightChanged(i, int.tryParse(value) ?? 0),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text('Kg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    onPressed: context.read<WorkoutDetailsCubit>().onAddSet,
                    child: const Text('  +  '),
                  )
                ],
              ),
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
                  onPressed: context.read<WorkoutDetailsCubit>().onSave,
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
