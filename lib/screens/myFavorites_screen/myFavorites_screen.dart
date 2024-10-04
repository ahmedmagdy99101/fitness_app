import 'package:fitness_app/screens/myFavorites_screen/myFavorites_widgets/meal_widget.dart';
import 'package:fitness_app/screens/myFavorites_screen/myFavorites_widgets/workout_widget.dart';
import 'package:fitness_app/screens/myFavorites_screen/myFavotites_cubit/myFavorites_cubit.dart';
import 'package:fitness_app/screens/myFavorites_screen/myFavotites_cubit/myFavorites_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavouritesScreen extends StatefulWidget {
  const MyFavouritesScreen({super.key});

  @override
  State<MyFavouritesScreen> createState() => _MyFavouritesScreenState();
}

class _MyFavouritesScreenState extends State<MyFavouritesScreen> {
  String selectedCategory = 'Meal';

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
              fontSize: 35,
              fontWeight: FontWeight.w400,
              fontFamily: 'Bebas',
            ),
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
                              setState(() {
                                selectedCategory = 'Meal';
                              });
                              context
                                  .read<MyFavouritesCubit>()
                                  .buildMyFavourites('Meal');
                              // MyFavouritesCubit.get(context)
                              //     .buildMyFavourites('Meal');
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: selectedCategory == 'Meal'
                                    ? Colors.black
                                    : Colors.white70,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              'Meal',
                              style: TextStyle(
                                color: selectedCategory == 'Meal'
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
                              setState(() {
                                selectedCategory = 'Workout';
                              });
                              context
                                  .read<MyFavouritesCubit>()
                                  .buildMyFavourites('Workout');
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: selectedCategory == 'Workout'
                                    ? Colors.black
                                    : Colors.white70,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              'Workout',
                              style: TextStyle(
                                color: selectedCategory == 'Workout'
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
                    if (state is WorkOutState) {
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
