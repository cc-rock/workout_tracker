import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_tracker/domain/models/exercise.dart';
import 'package:workout_tracker/domain/models/workout.dart';
import 'package:workout_tracker/domain/repositories/exercises_repository.dart';
import 'package:workout_tracker/domain/repositories/workouts_repository.dart';
import 'package:workout_tracker/utils/result.dart';

part 'workout_details_cubit.freezed.dart';

enum ViewMode {
  viewing,
  editing,
  adding,
}

@freezed
class WorkoutDetailsViewState with _$WorkoutDetailsViewState {
  const factory WorkoutDetailsViewState({
    required Workout workout,
    @Default(false) bool isLoading,
    @Default(false) bool isModified,
    @Default(ViewMode.viewing) ViewMode viewMode,
    @Default([]) List<Exercise> availableExercises,
  }) = _WorkoutDetailsViewState;
}

abstract class WorkoutDetailsNavigator {
  Future<void> showErrorMessage(String message);

  void closeScreen(bool shouldReloadWorkouts);
}

class WorkoutDetailsCubit extends Cubit<WorkoutDetailsViewState> {
  WorkoutDetailsCubit(
    this._exercisesRepository,
    this._workoutsRepository,
    this._navigator, {
    required WorkoutDetailsViewState initialState,
  }) : super(initialState) {
    if (initialState.viewMode != ViewMode.viewing) {
      _loadExercises();
    }
  }

  final ExercisesRepository _exercisesRepository;
  final WorkoutsRepository _workoutsRepository;
  final WorkoutDetailsNavigator _navigator;

  Future<void> _loadExercises() async {
    emit(state.copyWith(isLoading: true));
    final exercisesResult = await _exercisesRepository.getExercises();
    switch (exercisesResult) {
      case Failure(error: final error):
        emit(state.copyWith(isLoading: false));
        await _navigator.showErrorMessage(error.toString());
        break;
      case Success(data: final exercises):
        emit(state.copyWith(isLoading: false, availableExercises: exercises));
        break;
    }
  }

  Future<void> onEditWorkoutPressed() async {
    await _loadExercises();
    emit(state.copyWith(viewMode: ViewMode.editing));
  }

  void onAddSetPressed() {
    final newSets = List.of(state.workout.sets)
      ..add(Set(repetitions: 0, weight: 0, exercise: state.availableExercises.first));
    emit(state.copyWith(workout: state.workout.copyWith(sets: newSets)));
  }

  void onDeleteSetPressed(int index) {
    final newSets = List.of(state.workout.sets)..removeAt(index);
    emit(state.copyWith(workout: state.workout.copyWith(sets: newSets)));
  }

  void onSetRepetitionsChanged(int index, int repetitions) {
    final newSets = List.of(state.workout.sets);
    newSets[index] = newSets[index].copyWith(repetitions: repetitions);
    emit(state.copyWith(workout: state.workout.copyWith(sets: newSets)));
  }

  void onSetWeightChanged(int index, int weight) {
    final newSets = List.of(state.workout.sets);
    newSets[index] = newSets[index].copyWith(weight: weight);
    emit(state.copyWith(workout: state.workout.copyWith(sets: newSets)));
  }

  void onSetExerciseChanged(int index, Exercise exercise) {
    final newSets = List.of(state.workout.sets);
    newSets[index] = newSets[index].copyWith(exercise: exercise);
    emit(state.copyWith(workout: state.workout.copyWith(sets: newSets)));
  }

  void onNameChanged(String name) {
    emit(state.copyWith(workout: state.workout.copyWith(name: name)));
  }

  void onSavePressed() async {
    emit(state.copyWith(isLoading: true));
    final workout = state.workout;
    final result = state.viewMode == ViewMode.adding
        ? await _workoutsRepository.addWorkout(workout)
        : await _workoutsRepository.updateWorkout(workout);
    emit(state.copyWith(isLoading: false, isModified: true));
    switch (result) {
      case Failure(error: final error):
        _navigator.showErrorMessage(error.toString());
        break;
      case Success():
        if (state.viewMode == ViewMode.adding) {
          _navigator.closeScreen(true);
        } else {
          emit(state.copyWith(viewMode: ViewMode.viewing));
        }
        break;
    }
  }

  void onBackPressed() {
    _navigator.closeScreen(state.isModified);
  }
}
