import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/workout_details/widgets/editable_workout_set.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_cubit.dart';
import 'package:workout_tracker/utils/widgets/buttons.dart';
import 'package:workout_tracker/utils/widgets/spacers.dart';
import 'package:workout_tracker/utils/widgets/styles.dart';

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
          const Text('Name', style: fieldTitleStyle),
          TextFormField(
            initialValue: workout.name,
            style: const TextStyle(fontSize: 24),
            onChanged: (value) => context.read<WorkoutDetailsCubit>().onNameChanged(value),
          ),
          verticalSpacer,
          const Text('Sets', style: fieldTitleStyle),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < sets.length; i++)
                    EditableWorkoutSet(set: sets[i], index: i, availableExercises: availableExercises),
                  verticalSpacer,
                  RoundButton(
                    label: '  +  ',
                    onPressed: () => context.read<WorkoutDetailsCubit>().onAddSet(),
                  ),
                ],
              ),
            ),
          ),
          verticalSpacer,
          ExpandedRoundButton(label: 'Save', onPressed: () => context.read<WorkoutDetailsCubit>().onSave()),
          bottomScreenSpacer,
        ],
      ),
    );
  }
}
