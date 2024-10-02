import 'package:fitness_app/screens/my%20favourites_screen/myfavourites_cubit/myfavourites_cubit.dart';
import 'package:fitness_app/screens/my%20favourites_screen/myfavourites_cubit/myfavourites_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/meal_widget.dart';
import 'widgets/workout_widget.dart';

class MyFavouritesScreen extends StatefulWidget {
  const MyFavouritesScreen({super.key});

  @override
  State<MyFavouritesScreen> createState() => _MyFavouritesScreenState();
}

class _MyFavouritesScreenState extends State<MyFavouritesScreen> {

  String selectedCategory = 'Meal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY FAVOURITES',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
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
                        MyFavouritesCubit.get(context).buildMyFavourites('Meal');
                      },
                      child: Text(
                        'Meal',
                        style: TextStyle(
                          color: selectedCategory == 'Meal' ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: selectedCategory == 'Meal' ? Colors.black : Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
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
                        MyFavouritesCubit.get(context).buildMyFavourites(
                            'Workout');
                      },
                      child: Text(
                        'Workout',
                        style: TextStyle(
                          color: selectedCategory == 'Workout' ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: selectedCategory == 'Workout' ? Colors.black : Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                ),
              ),
            ],
          ),
          BlocBuilder<MyFavouritesCubit, MyFavouritesState>(
            builder: (context, state) {
              if (state is WorkOutState) {
                return WorkoutWidget();
              }
              else {
                return MealWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}




