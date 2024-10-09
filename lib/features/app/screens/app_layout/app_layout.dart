import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:fitness_app/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/app_cubit/app_cubit.dart';
import '../../cubit/app_cubit/app_states.dart';
import '../drawer/my_drawer.dart';

class AppLayoutPage extends StatelessWidget {
  const AppLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          //  backgroundColor: Colors.white,
          drawer: const MyDrawer(),
          body: AppCubit.get(context)
              .bottomNavPages[AppCubit.get(context).bottomNavIndex],
          bottomNavigationBar: CustomNavigationBar(
            backgroundColor: const Color(0xFFF7F7F7),
            selectedColor: AppColors.primaryColor,
            unSelectedColor: Colors.white,
            currentIndex: AppCubit.get(context).bottomNavIndex,
            strokeColor: const Color(0xFF707070),
            onTap: (int index) {
              AppCubit.get(context).changeBottomNavbar(index);
            },
            elevation: 1,
            items: [
              CustomNavigationBarItem(
                selectedTitle: const Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                icon: Image.asset(
                  "assets/icons/home.png",
                  color: const Color(0xFF707070).withOpacity(0.5),
                ),
                selectedIcon: Image.asset(
                  "assets/icons/home.png",
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF707070).withOpacity(0.5)),
                ),
              ),
              CustomNavigationBarItem(
                selectedTitle: const Text(
                  "Meal Plans",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                icon: Image.asset(
                  "assets/icons/meal_plans.png",
                  color: const Color(0xFF707070).withOpacity(0.5),
                ),
                selectedIcon: Image.asset(
                  "assets/icons/meal_plans.png",
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  "Meal Plans",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF707070).withOpacity(0.5)),
                ),
              ),
              CustomNavigationBarItem(
                selectedTitle: const Text(
                  "Exercise",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                icon: Image.asset(
                  "assets/icons/exercise.png",
                  color: const Color(0xFF707070).withOpacity(0.5),
                ),
                selectedIcon: Image.asset(
                  "assets/icons/exercise.png",
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  "Exercise",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF707070).withOpacity(0.5)),
                ),
              ),
              CustomNavigationBarItem(
                selectedTitle: const Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                icon: Image.asset(
                  "assets/icons/profile.png",
                  color: const Color(0xFF707070).withOpacity(0.5),
                ),
                selectedIcon: Image.asset(
                  "assets/icons/profile.png",
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF707070).withOpacity(0.5)),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
