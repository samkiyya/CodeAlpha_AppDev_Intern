// workout_history_screen.dart
import 'package:flutter/material.dart';

import 'workout_list.dart';

class WorkoutHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorkoutList(),
    );
  }
}
