import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_tracker/di.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/screens/my_workouts/my_workouts_cubit.dart';
import 'package:workout_tracker/screens/my_workouts/widgets/workout_list_tile.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_screen.dart';
import 'package:workout_tracker/utils/widgets/buttons.dart';
import 'package:workout_tracker/utils/widgets/dialogs.dart';
import 'package:workout_tracker/utils/widgets/loading_overlay.dart';
import 'package:workout_tracker/utils/widgets/screen_container.dart';
import 'package:workout_tracker/utils/widgets/spacers.dart';

class MyWorkoutsScreen extends StatelessWidget {
  const MyWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MyWorkoutsCubit>(param1: _MyWorkoutsNavigatorImpl(context)),
      child: BlocBuilder<MyWorkoutsCubit, MyWorkoutsViewState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Workouts'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Stack(
              children: [
                ScreenContainer(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.workouts.length,
                          itemBuilder: (context, index) {
                            final workout = state.workouts[index];
                            return WorkoutListTile(
                              workout: workout,
                              onTap: () => context.read<MyWorkoutsCubit>().onWorkoutSelected(workout),
                              onDeleteTapped: () => context.read<MyWorkoutsCubit>().onDeleteWorkout(workout),
                            );
                          },
                        ),
                      ),
                      verticalSpacer,
                      ExpandedRoundButton(
                        label: 'Add workout',
                        onPressed: () => context.read<MyWorkoutsCubit>().onAddWorkout(),
                      ),
                      bottomScreenSpacer,
                    ],
                  ),
                ),
                LoadingOverlay(isLoading: state.isLoading),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MyWorkoutsNavigatorImpl implements MyWorkoutsNavigator {
  const _MyWorkoutsNavigatorImpl(this._context);

  final BuildContext _context;

  @override
  Future<void> showErrorMessage(String message) => _context.showErrorDialog(message);

  @override
  Future<bool> showConfirmationMessage({required String title, required String message}) async {
    final result = await _context.showConfirmationDialog(title: title, message: message);
    return result ?? false;
  }

  @override
  Future<bool> goToWorkoutDetails(Workout workout) async {
    final result = await Navigator.of(_context).push<bool>(MaterialPageRoute(
      builder: (context) => WorkoutDetailsScreen.view(workout),
    ));
    return result ?? false;
  }

  @override
  Future<bool> goToAddWorkout() async {
    final result = await Navigator.of(_context).push<bool>(MaterialPageRoute(
      builder: (context) => WorkoutDetailsScreen.add(),
    ));
    return result ?? false;
  }
}
