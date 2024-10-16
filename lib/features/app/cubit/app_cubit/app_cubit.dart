import 'package:fitness_app/features/meals/screens/meals_screen/meal_plan.dart';
import 'package:fitness_app/features/profile/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../exercise/screens/Exercise_Screens/Full Exercise.dart';
import '../../../home/screens/home_screen/home_screen.dart';
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
     ExerciseScreen(),
    const ProfileScreen(),
  ];

  void changeBottomNavbar(index) {
    bottomNavIndex = index;
    emit(ChangeBottomNavbarState());
  }
}

var scaffoldKey = GlobalKey<ScaffoldState>();
