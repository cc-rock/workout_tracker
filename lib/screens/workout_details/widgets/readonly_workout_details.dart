import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/workout_details/widgets/readonly_workout_set.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_cubit.dart';
import 'package:workout_tracker/utils/widgets/buttons.dart';
import 'package:workout_tracker/utils/widgets/spacers.dart';
import 'package:workout_tracker/utils/widgets/styles.dart';

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
          const Text('Name', style: fieldTitleStyle),
          Text(
            workout.name,
            style: const TextStyle(fontSize: 24),
          ),
          verticalSpacer,
          const Text('Sets', style: fieldTitleStyle),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                for (final set in workout.sets)
                  ReadonlyWorkoutSet(set: set),
              ]),
            ),
          ),
          verticalSpacer,
          ExpandedRoundButton(label: 'Edit', onPressed: () => context.read<WorkoutDetailsCubit>().onEditWorkout()),
          bottomScreenSpacer,
        ],
      ),
    );
  }
}
