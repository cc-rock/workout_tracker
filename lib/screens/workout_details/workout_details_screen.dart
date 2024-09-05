import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/di.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/workout_details/widgets/editable_workout_details.dart';
import 'package:workout_tracker/screens/workout_details/widgets/readonly_workout_details.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_cubit.dart';
import 'package:workout_tracker/utils/widgets/screen_container.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  const WorkoutDetailsScreen._({
    this.initialWorkout,
    this.initialViewMode = ViewMode.viewing,
  });

  final Workout? initialWorkout;
  final ViewMode initialViewMode;

  factory WorkoutDetailsScreen.view(Workout workout) {
    return WorkoutDetailsScreen._(initialWorkout: workout);
  }

  factory WorkoutDetailsScreen.edit(Workout workout) {
    return WorkoutDetailsScreen._(initialWorkout: workout, initialViewMode: ViewMode.editing);
  }

  factory WorkoutDetailsScreen.add() {
    return const WorkoutDetailsScreen._(initialViewMode: ViewMode.adding);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkoutDetailsCubit>(
        param1: _WorkoutDetailsNavigatorImpl(context),
        param2: WorkoutDetailsViewState(
          workout: initialWorkout ?? const Workout(id: '', name: '', sets: []),
          viewMode: initialViewMode,
        ),
      ),
      child: BlocBuilder<WorkoutDetailsCubit, WorkoutDetailsViewState>(
        builder: (context, state) {
          final title = switch (state.viewMode) {
            ViewMode.adding => 'Add workout',
            ViewMode.editing => 'Edit workout',
            ViewMode.viewing => 'Workout details',
          };
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ScreenContainer(
                    child: state.viewMode == ViewMode.viewing
                        ? ReadOnlyWorkoutDetails(workout: state.workout)
                        : EditableWorkoutDetails(workout: state.workout, availableExercises: state.availableExercises),
                  ),
          );
        },
      ),
    );
  }
}

class _WorkoutDetailsNavigatorImpl implements WorkoutDetailsNavigator {
  const _WorkoutDetailsNavigatorImpl(this._context);

  final BuildContext _context;

  @override
  Future<void> showErrorMessage(String message) async {
    await showDialog(
      context: _context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void closeScreen(bool shouldReloadWorkouts) {
    Navigator.of(_context).pop(shouldReloadWorkouts);
  }
}
