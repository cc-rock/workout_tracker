import 'package:flutter/material.dart';
import 'package:workout_tracker/domain/models/workout.dart';

class WorkoutListTile extends StatelessWidget {
  const WorkoutListTile({
    super.key,
    required this.workout,
    this.onTap,
    this.onDeleteTapped,
  });

  final Workout workout;
  final VoidCallback? onTap;
  final VoidCallback? onDeleteTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(workout.name),
      subtitle: Text('N. of sets: ${workout.sets.length}'),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDeleteTapped,
      ),
    );
  }
}
