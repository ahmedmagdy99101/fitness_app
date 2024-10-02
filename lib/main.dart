import 'package:fitness_app/screens/app_layout/app_layout.dart';
import 'package:fitness_app/screens/my%20favourites_screen/myfavourites_cubit/myfavourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/my favourites_screen/my favourites_layout.dart';


void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => MyFavouritesCubit()),
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyFavouritesScreen(),
    );
  }
}

