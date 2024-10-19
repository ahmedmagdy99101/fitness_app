import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/features/app/screens/app_layout/app_layout.dart';
import 'package:fitness_app/push_notifications.dart';
import 'package:fitness_app/screens/SplachScreen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/app/cubit/app_cubit/app_cubit.dart';
import 'features/app/cubit/app_cubit/app_states.dart';
import 'firebase_options.dart';
import 'shared/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppNotifications().init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // User? userA;
          // FirebaseAuth.instance.authStateChanges().listen((User? user) {
          //   print(user);
          //   if (user == null) {
          //     userA = null;
          //   } else {
          //     userA = user;
          //   }
          // });
          print(FirebaseAuth.instance.currentUser);
          return MaterialApp(
            title: 'Fitness Tracker App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              fontFamily: "Montserrat",
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
            ),
            home: FirebaseAuth.instance.currentUser == null
                ? const SplashFitnessScreen()
                : const AppLayoutPage(),
          );
        },
      ),
    );
  }
}
