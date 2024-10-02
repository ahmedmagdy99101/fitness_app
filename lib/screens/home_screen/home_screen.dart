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
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(30, 15),
                bottomRight: Radius.elliptical(30, 15),
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
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/menu_icon.png',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: const AssetImage(
                            'assets/images/avatar.png',
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
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
                    height: 110,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                'assets/images/category1.png',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Cycling"),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                      itemCount: 5,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Exercise",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("See all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/popular_exercise1.png',
                              width: double.infinity,
                              height: 190,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Full Shot Woman Stretching Arm",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Beginner  |  ",
                                  style: TextStyle(
                                      color: Color(0xFF303841),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  Icons.timer_outlined,
                                  size: 12,
                                  color: Color(0xFF00ADB5),
                                ),
                                Text(
                                  " 15 min",
                                  style: TextStyle(
                                      color: Color(0xFF303841),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Meal Plans",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("See all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/meal_plans1.png',
                              width: double.infinity,
                              height: 190,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Greek salad with lettuce, green onion, ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "150 kcal",
                              style: TextStyle(
                                  color: Color(0xFF303841),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Additional Exercise",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("See all",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/popular_exercise1.png',
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Exercises with Sitting\nDumbbells',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/fire.png',
                                    width: 13,
                                  ),
                                  const Text(
                                    ' 135 kcal  |  ',
                                  ),
                                  Image.asset(
                                    'assets/icons/clock.png',
                                    width: 13,
                                  ),
                                  const Text(
                                    ' 5 min',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Beginner',
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey[300]!,
                      );
                    },
                    itemCount: 4,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
