import 'package:fitness_app/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:fitness_app/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Column(
        children: [
          Container(
            height: 237,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(50, 30),
                bottomRight: Radius.elliptical(50, 30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/menu_icon.png',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/home_main_banner.png",
                  width: double.infinity,
                  // height: 200,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("SELECT YOUR GOAL",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final cubit = HomeCubit.get(context);
                    return SizedBox(
                      height: 85,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              cubit.selectGoal(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: cubit.selectedGoal == index
                                    ? Colors.black
                                    : Colors.grey[300]!,
                              ),
                              child: Text(
                                cubit.goalsLabels[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: cubit.selectedGoal == index
                                      ? Colors.white
                                      : Colors.grey[800]!,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount: 4,
                      ),
                    );
                  },
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("CATEGORIES",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("See all",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ClipOval(
                        child: Image.asset(
                          width: 80,
                          fit: BoxFit.cover,
                          'assets/images/category1.png',
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10);
                    },
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
