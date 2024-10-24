import 'package:fitness_app/features/app/widgets/favorites_widget/meal_widget.dart';
import 'package:fitness_app/features/app/widgets/favorites_widget/workout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/favorites_cubit/favorites_cubit.dart';
import '../../../cubit/favorites_cubit/favorites_states.dart';

class MyFavouritesScreen extends StatefulWidget {
  const MyFavouritesScreen({super.key});

  @override
  State<MyFavouritesScreen> createState() => _MyFavouritesScreenState();
}

class _MyFavouritesScreenState extends State<MyFavouritesScreen> {


  List<Meal> meals = [
  Meal(
  imagePath: 'assets/images/m1.jpeg',
  name: 'Green beans,tomatoes,eggs',
  calories: '135 kcal',
  time: '30 min',
  ),
  Meal(
  imagePath: 'assets/images/m2.jpeg',
  name: 'Healthy balanced vegetarian food',
  calories: '250 kcal',
  time: '45 min',
  ),
  Meal(
  imagePath: 'assets/images/m3.jpeg',
  name: 'Ketogenic/paleo diet.fried eggs, salmon',
  calories: '80 kcal',
  time: '15 min',
  )];
  List<Workout> workouts = [
    Workout(
      imagePath: 'assets/images/w1.jpeg',
      name: 'Full Shot Woman Stretching Arm',
      calories: '200 kcal',
      time: '45 min',
    ),
    Workout(
      imagePath: 'assets/images/w2.jpeg',
      name: 'Athlete Practicing Claps hands Arm Balance',
      calories: '300 kcal',
      time: '30 min',
    ),
    Workout(
      imagePath: 'assets/images/w3.jpeg',
      name: 'Athlete Practicing Monochrome',
      calories: '250 kcal',
      time: '60 min',
    ),
    // Add more workouts here...
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MyFavouritesCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MY FAVOURITES',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                letterSpacing: 1,
                fontWeight: FontWeight.w400,
                fontFamily: 'Bebas'),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<MyFavouritesCubit, MyFavouritesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {
                              // setState(() {
                              //   selectedCategory = 'Meal';
                              // });
                              context
                                  .read<MyFavouritesCubit>()
                                  .changeSelectedCategory('Meal');
                              // context
                              //     .read<MyFavouritesCubit>()
                              //     .buildMyFavourites('Meal');
                              // MyFavouritesCubit.get(context)
                              //     .buildMyFavourites('Meal');
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: context
                                            .read<MyFavouritesCubit>()
                                            .selectedCategory ==
                                        'Meal'
                                    ? Colors.black
                                    : Colors.white70,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              'Meal',
                              style: TextStyle(
                                color: context
                                            .read<MyFavouritesCubit>()
                                            .selectedCategory ==
                                        'Meal'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {
                              // setState(() {
                              //   selectedCategory = 'Workout';
                              // });
                              context
                                  .read<MyFavouritesCubit>()
                                  .changeSelectedCategory('Workout');
                              // context
                              //     .read<MyFavouritesCubit>()
                              //     .buildMyFavourites('Workout');
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: context
                                            .read<MyFavouritesCubit>()
                                            .selectedCategory ==
                                        'Workout'
                                    ? Colors.black
                                    : Colors.white70,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              'Workout',
                              style: TextStyle(
                                color: context
                                            .read<MyFavouritesCubit>()
                                            .selectedCategory ==
                                        'Workout'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<MyFavouritesCubit, MyFavouritesState>(
                  builder: (context, state) {
                    if (context.read<MyFavouritesCubit>().selectedCategory ==
                        'Workout') {
                      return  WorkoutWidget(workouts: workouts,);
                    } else {
                      return  MealWidget(meals: meals);
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
