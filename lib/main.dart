import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/features/app/screens/app_layout/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/app/cubit/app_cubit/app_cubit.dart';
import 'features/app/cubit/app_cubit/app_states.dart';
import 'firebase_options.dart';
import 'shared/app_colors.dart';

void main() async {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: "basic key",
          channelName: "test channel",
          channelDescription: "notificaions for test",
          playSound: true,
          channelShowBadge: true,
        )
      ],
      debug: true);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            home: const AppLayoutPage(),
          );
        },
      ),
    );
  }
}
