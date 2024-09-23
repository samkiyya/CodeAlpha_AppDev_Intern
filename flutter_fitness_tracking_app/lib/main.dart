import 'package:flutter/material.dart';
import 'package:flutter_fitness_tracking_app/views/splashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'controllers/workout_controller.dart';

void main() {
  runApp(const FitnessTrackerApp());
}

class FitnessTrackerApp extends StatelessWidget {
  const FitnessTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => ChangeNotifierProvider(
        create: (context) => WorkoutController(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fitness Tracker App',
          theme: ThemeData(),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
