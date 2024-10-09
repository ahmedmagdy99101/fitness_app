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
                      return const WorkoutWidget();
                    } else {
                      return const MealWidget();
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
