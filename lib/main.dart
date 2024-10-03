import 'package:fitness_app/screens/training_screen/training_screen.dart';
import 'package:flutter/material.dart';

import 'shared/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        fontFamily: "Montserrat",
        useMaterial3: true,
      ),
      home: const TrainingScreen(),
    );
  }
}
