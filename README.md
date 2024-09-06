# workout_tracker
Example app for tracking workouts

## Supported platforms
This app can be run on iOS, Android, and web.

## Architectural choices
The app is based on the Clean Architecture, with separation between the domain layer (`lib/domain` folder), containing the core data models, business logic and interfaces for repositories and external services, the data layer (`lib/data` folder), containing concrete implementations for repositories, and the presentation layer (`/lib/screens` folder), containing the UI and navigation logic.

For the presentation layer, the BLOC library (and pattern) has been chosen, in particular cubits have been used instead of blocs, since we didn't need the extra complexity of handling streams of input events. The presentation architecture is, in the end, equivalent to MVVM, with the cubit acting as the ViewModel, the screen widget acting as the View, and the domain and data layers acting as the Model layer.

## Third party library choices
- Dependency injection: *get_it* - Simple and very popular service locator library, more than enough for this exercise. In a bigger project my preferred choice is usually get_it but in conjuntion with *injectable*, a code generator that generates the get_it configuration for you, based on annotations.
- Data classes: *freezed* - A very powerful code generation library that creates fully immutable and comparable data classes, with handy methods such as `map` and `copyWith`.

## Tests
- Unit tests: `test/screens/my_workouts/my_workouts_cubit_test.dart`
- Widget tests: `test/screens/my_workouts/my_workouts_screen_test.dart`
- Integration tests: `integration_test/add_workout_test.dart`

## Possible improvements
- Eliminate hard coded strings and implement proper localisation, for example using the flutter_localizations library
- Implement the possibility of reordering sets when editing a workout
- Write more tests - the included ones do not cover the entire app
