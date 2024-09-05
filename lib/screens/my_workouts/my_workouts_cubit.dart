import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/domain/repositories/workouts_repository.dart';
import 'package:workout_tracker/utils/result.dart';

part 'my_workouts_cubit.freezed.dart';

@freezed
class MyWorkoutsViewState with _$MyWorkoutsViewState {
  const factory MyWorkoutsViewState({
    @Default([]) List<Workout> workouts,
    @Default(false) bool isLoading,
  }) = _MyWorkoutsViewState;
}

abstract class MyWorkoutsNavigator {
  Future<void> showErrorMessage(String message);

  /// Returns true if the user has confirmed the action
  Future<bool> showConfirmationMessage(
      {required String title, required String message});

  /// Returns true if the workouts need to be reloaded when returning
  Future<bool> goToWorkoutDetails(Workout workout);

  /// Returns true if the workouts need to be reloaded when returning
  Future<bool> goToAddWorkout();
}

class MyWorkoutsCubit extends Cubit<MyWorkoutsViewState> {
  MyWorkoutsCubit(this._repository, this._navigator)
      : super(const MyWorkoutsViewState()) {
    _loadWorkouts();
  }

  final WorkoutsRepository _repository;
  final MyWorkoutsNavigator _navigator;

  Future<void> _loadWorkouts() async {
    emit(state.copyWith(isLoading: true));
    final workoutsResult = await _repository.getWorkouts();
    switch (workoutsResult) {
      case Failure(error: final error):
        emit(state.copyWith(isLoading: false));
        await _navigator.showErrorMessage(error.toString());
        break;
      case Success(data: final workouts):
        emit(state.copyWith(isLoading: false, workouts: workouts));
        break;
    }
  }

  Future<void> onWorkoutSelected(Workout workout) async {
    final shouldReload = await _navigator.goToWorkoutDetails(workout);
    if (shouldReload) {
      _loadWorkouts();
    }
  }

  Future<void> onAddWorkout() async {
    final shouldReload = await _navigator.goToAddWorkout();
    if (shouldReload) {
      _loadWorkouts();
    }
  }

  Future<void> onDeleteWorkout(Workout workout) async {
    final confirmed = await _navigator.showConfirmationMessage(
      title: 'Confirmation',
      message: 'Delete workout ${workout.name}?',
    );
    if (!confirmed) {
      return;
    }
    final result = await _repository.deleteWorkout(workout.id);
    if (result is Failure) {
      await _navigator.showErrorMessage(result.error.toString());
    } else {
      _loadWorkouts();
    }
  }
}
