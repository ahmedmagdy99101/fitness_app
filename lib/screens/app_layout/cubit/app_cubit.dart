import 'package:fitness_app/screens/meal_plan_screens/_meal_plan.dart';
import 'package:fitness_app/screens/profile_screens/_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Exercise_Screens/Full Exercise.dart';
import '../../home_screen/home_screen.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDarkTheme = false;

  void changeTheme() {
    state is DarkThemeState ? isDarkTheme = true : isDarkTheme = false;
    emit(state is LightThemeState ? DarkThemeState() : LightThemeState());
    print(isDarkTheme);
  }

  int bottomNavIndex = 0;

  List<Widget> bottomNavPages = [
    const HomeScreen(),
    const MealPlanScreen(),
    const ExerciseScreen(),
    const ProfileScreen(),
  ];

  void changeBottomNavbar(index) {
    bottomNavIndex = index;
    emit(ChangeBottomNavbarState());
  }
}

var scaffoldKey = GlobalKey<ScaffoldState>();
