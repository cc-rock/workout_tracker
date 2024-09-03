import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/my_workouts/my_workouts_screen.dart';

class WorkoutTrackerApp extends StatelessWidget {
  const WorkoutTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWorkoutsScreen(),
    );
  }
}
