import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class StartTraining_Screen extends StatefulWidget {
  const StartTraining_Screen({super.key});

  @override
  State<StartTraining_Screen> createState() => _StartTraining_ScreenState();
}

class _StartTraining_ScreenState extends State<StartTraining_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Stack(
              children: [
                   Image.asset(
                    'assets/images/image_5.png',
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child:  Row(
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Exercise 3/12"),
                       SizedBox(height: 10,),
                       Text("Stretching Workout Length", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
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
                    NeonCircularTimer(
                      width: 120,
                      duration: 20,
                      controller: CountDownController(),
                      isTimerTextShown: true,
                      neumorphicEffect: true,
                      innerFillGradient: const LinearGradient(colors: [
                        Colors.black,
                        Colors.black
                      ]),
                      neonGradient: const LinearGradient(colors: [
                        Colors.white,
                        Colors.black,
                      ]),
                    ),
                    SizedBox(height: 20,),
                    Text("10:59", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                          // Handle Next Steps action
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
                  SizedBox(width: 10,),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9ACD32), // Light green color
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      onPressed: () {
                        // Handle Next Steps action
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
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Exercise_Card(
                    'assets/images/89694286_XS-removebg-preview 1.png',
                    "Exercises With Sitting Dumbbells",
                    125,
                    5,
                    "Beginner"
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Exercise_Card extends StatelessWidget {
  final String title;
  final String image;
  final int calories;
  final int time;
  final String level;

  const Exercise_Card (this.image, this.title, this.calories, this.time, this.level);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  child: Image(image: AssetImage(image)),
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.topLeft,
                      child: Text(title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10,),
                    FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.local_fire_department),
                          Text("$calories KCL"),
                          SizedBox(width: 5,),
                          Text('|'),
                          SizedBox(width: 5,),
                          Icon(Icons.timer),
                          Text("$time min")

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    FittedBox(
                        alignment: Alignment.bottomLeft,
                        child: Text(level))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}