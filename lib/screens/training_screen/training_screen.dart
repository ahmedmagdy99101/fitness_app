import 'package:fitness_app/screens/training_screen/training_widget/just_for_you_widget.dart';
import 'package:fitness_app/screens/training_screen/training_widget/popular_training_widget.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  String selectedCategory = 'Beginner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TRAINING".toUpperCase(),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              fontFamily: 'Bebas'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'Beginner';
                        });
                      },
                      style: TextButton.styleFrom(
                          fixedSize: const Size(38, 60),
                          backgroundColor: selectedCategory == 'Beginner'
                              ? Colors.black
                              : Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Beginner',
                        style: TextStyle(
                          color: selectedCategory == 'Beginner'
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = 'Intermediate';
                          });
                        },
                        style: TextButton.styleFrom(
                            fixedSize: const Size(38, 60),
                            backgroundColor: selectedCategory == 'Intermediate'
                                ? Colors.black
                                : Colors.white70,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          'Intermediate',
                          style: TextStyle(
                            color: selectedCategory == 'Intermediate'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = 'Advanced';
                        });
                      },
                      style: TextButton.styleFrom(
                          fixedSize: const Size(38, 60),
                          backgroundColor: selectedCategory == 'Advanced'
                              ? Colors.black
                              : Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Advanced',
                        style: TextStyle(
                          color: selectedCategory == 'Advanced'
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Popular Training',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const PopularTrainingWidget(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'Just for you',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const JustForYouWidget()
          ],
        ),
      ),
    );
  }
}
