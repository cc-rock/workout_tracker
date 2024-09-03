import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/data/hardcoded_exercises_repository.dart';
import 'package:workout_tracker/data/shared_preferences_workouts_repository.dart';
import 'package:workout_tracker/domain/repositories/exercises_repository.dart';
import 'package:workout_tracker/domain/repositories/workouts_repository.dart';
import 'package:workout_tracker/screens/my_workouts/my_workouts_cubit.dart';
import 'package:workout_tracker/screens/workout_details/workout_details_cubit.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerLazySingleton<ExercisesRepository>(
      () => HardcodedExercisesRepository());
  getIt.registerLazySingleton<WorkoutsRepository>(
    () => SharedPreferencesWorkoutsRepository(
      SharedPreferencesAsync(),
      getIt<ExercisesRepository>(),
    ),
  );

  getIt.registerFactoryParam<MyWorkoutsCubit, MyWorkoutsNavigator, void>(
    (navigator, _) => MyWorkoutsCubit(getIt<WorkoutsRepository>(), navigator),
  );
  getIt.registerFactoryParam<WorkoutDetailsCubit, WorkoutDetailsNavigator,
      WorkoutDetailsViewState>(
    (navigator, initialState) => WorkoutDetailsCubit(
      getIt<ExercisesRepository>(),
      getIt<WorkoutsRepository>(),
      navigator,
      initialState: initialState,
    ),
  );
}
