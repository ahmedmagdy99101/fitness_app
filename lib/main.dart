import 'package:fitness_app/screens/app_layout/app_layout.dart';
import 'package:fitness_app/screens/myFavorites_screen/myFavotites_cubit/myFavorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/app_colors.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context ) =>MyFavouritesCubit())
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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        fontFamily: "Montserrat",
        useMaterial3: true,
      ),
      home: const AppLayoutPage(),
    );
  }
}
