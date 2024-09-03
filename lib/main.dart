import 'package:flutter/material.dart';
import 'package:workout_tracker/di.dart';
import 'package:workout_tracker/workout_tracker_app.dart';

void main() {
  setupDi();
  runApp(const WorkoutTrackerApp());
}
