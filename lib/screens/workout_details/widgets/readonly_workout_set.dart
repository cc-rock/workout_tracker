import 'package:flutter/widgets.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/utils/widgets/spacers.dart';

class ReadonlyWorkoutSet extends StatelessWidget {
  const ReadonlyWorkoutSet({super.key, required this.set});

  final Set set;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Expanded(
          flex: 5,
          child: Text(
            set.exercise.name,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        horizontalSpacer,
        Expanded(
          flex: 3,
          child: Text(
            '${set.repetitions} reps',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.end,
          ),
        ),
        horizontalSpacer,
        Expanded(
          flex: 2,
          child: Text(
            '${set.weight} Kg',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
