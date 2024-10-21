import 'package:fitness_app/features/exercise/screens/Exercise_Screens/Result.dart';
import 'package:fitness_app/features/exercise/widgets/Exercise_Card.dart';
import 'package:fitness_app/features/exercise/widgets/bulidElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import '../../widgets/bulidTimer.dart';
import 'ExerciseDetails.dart';

CountDownController controller = CountDownController();

class StartTraining_Screen extends StatefulWidget {
  const StartTraining_Screen({super.key});

  @override
  State<StartTraining_Screen> createState() => _StartTraining_ScreenState();
}

class _StartTraining_ScreenState extends State<StartTraining_Screen> {
  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Stack(
              children: [
                   Image.network(
                    argument['image'],
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
             Padding(
              padding: const EdgeInsets.only(top: 8, left: 12),
              child:  Row(
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("Exercise 3/12"),
                       const SizedBox(height: 10,),
                       Text(argument['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                     ],
                   ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Column(
                  children: [
                    bulidTimer(controller),
                    const SizedBox(height: 20,),
                    SizedBox(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE2DFDF), // Light green color
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          ),
                          onPressed: () {
                            setState(() {
                             controller.resume();
                            });
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.not_started_outlined,color: Colors.black,),
                              SizedBox(width: 5,),
                              Text(
                                'Start',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE2DFDF), // Light green color
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        ),
                        onPressed: () {
                         setState(() {
                           controller.pause();
                         });
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.pause,color: Colors.black,),
                            SizedBox(width: 5,),
                            Text(
                              'STOP',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9ACD32), // Light green color
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseDetails_Screen(), settings:
                        RouteSettings(arguments:{'title' : "Exercises With Sitting Dumbbells", 'calories' : 125, 'time' : 5, 'level' : 'Beginner'})));
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.directions_run, color: Colors.white,),
                          SizedBox(width: 5,),
                          Text(
                            'NEXT TRANING',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35, top: 5),
              child: Row(
                children: [
                  Text("Up Next", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Exercise_Card(
                onTap: (){},
                image: "assets/images/image_5.png",
                title: "PUSH-UPS",
                time: "10 MIN",
                calories: "100 KCAL",
                level: "Beginner",
            ),
            bulidElevatedButton(
                "FINISH",
                (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Result_Screen(), settings:
                  RouteSettings(arguments: {'image' : argument['image'], 'title' : argument['title']})));
                })
          ],
        ),
      ),
    );
  }
}



