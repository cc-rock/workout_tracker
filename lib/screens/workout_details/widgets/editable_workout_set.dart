import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_cubit.dart';
import 'package:workout_tracker/utils/widgets/spacers.dart';

class EditableWorkoutSet extends StatelessWidget {
  const EditableWorkoutSet({super.key, required this.set, required this.index, required this.availableExercises});

  final Set set;
  final int index;
  final List<Exercise> availableExercises;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            context.read<WorkoutDetailsCubit>().onDeleteSetPressed(index);
          },
        ),
        Expanded(
          flex: 5,
          child: DropdownButtonFormField<Exercise>(
            value: set.exercise,
            items: availableExercises
                .map((exercise) => DropdownMenuItem(
                      value: exercise,
                      child: Text(exercise.name),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<WorkoutDetailsCubit>().onSetExerciseChanged(index, value);
              }
            },
          ),
        ),
        horizontalSpacer,
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  initialValue: set.repetitions.toString(),
                  onChanged: (value) =>
                      context.read<WorkoutDetailsCubit>().onSetRepetitionsChanged(index, int.tryParse(value) ?? 0),
                ),
              ),
              const SizedBox(width: 8),
              const Text('reps'),
            ],
          ),
        ),
        horizontalSpacer,
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  initialValue: set.weight.toString(),
                  onChanged: (value) =>
                      context.read<WorkoutDetailsCubit>().onSetWeightChanged(index, int.tryParse(value) ?? 0),
                ),
              ),
              const SizedBox(width: 8),
              const Text('Kg'),
            ],
          ),
        ),
      ],
    );
  }
}
