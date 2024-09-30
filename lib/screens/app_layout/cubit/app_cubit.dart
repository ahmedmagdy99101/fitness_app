

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home_screen/home_screen.dart';
import 'app_states.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDarkTheme = false ;
  void changeTheme() {
    state is DarkThemeState ? isDarkTheme = true : isDarkTheme = false ;
    emit(state is LightThemeState ? DarkThemeState() : LightThemeState());
    print(isDarkTheme);
  }

  int bottomNavIndex =0 ;
  List<Widget> bottomNavPages =  [
     const HomeScreen(),
       Container(),
       Container(),
       Container(),
  ];
  void changeBottomNavbar(index) {
    bottomNavIndex = index;
    emit(ChangeBottomNavbarState());
  }

}