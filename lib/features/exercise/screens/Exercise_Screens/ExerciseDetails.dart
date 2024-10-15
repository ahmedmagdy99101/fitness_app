import 'package:flutter/material.dart';
import 'Schedula.dart';
import 'StartTraining_Screen.dart';

class ExerciseDetails_Screen extends StatefulWidget {
  const ExerciseDetails_Screen({super.key});

  @override
  State<ExerciseDetails_Screen> createState() => _ExerciseDetails_ScreenState();
}

class _ExerciseDetails_ScreenState extends State<ExerciseDetails_Screen> {
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
                Image.asset(
                  'assets/images/img.png',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(Icons.local_fire_department),
                            SizedBox(width: 4),
                            Text('${argument['calories']}'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(Icons.timer),
                            SizedBox(width: 4),
                            Text('${argument['time']} min'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ExerciseInfo('Level','${argument['level']}'),
                      ExerciseInfo('Category','Cardio'),
                      ExerciseInfo('Weight','Lose'),
                    ],
                  ),
                  const SizedBox(height: 16),
                   Text(
                    '${argument['title']}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "There are many variations of passages of Lorem \n Ipsum available, but the majority have suffered \n alteration in some form, by injected humour",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3 Weeks - 20 Exercise", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      scheduleButton("Schedule", context)
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("Exercise Program", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        buildButton('Cardio', true),
                        buildButton('Legs', false),
                        buildButton('Back', false),
                        buildButton('Chets', false),
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
                          "Beginner"),
                      Exercise_Card(
                          'assets/images/image 6.png',
                          "Exercises With Sitting Dumbbells",
                          125,
                          5,
                          "Beginner"),
                      Exercise_Card(
                          'assets/images/images-removebg-preview 1.png',
                          "Exercises With Sitting Dumbbells",
                          125,
                          5,
                          "Beginner"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9ACD32), // Light green color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StartTraining_Screen(), settings:
                  RouteSettings(arguments: argument['title'])));
                },
                child: const Text(
                  'Start Now',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget scheduleButton(String text, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Schedule()));
      },
      color:  Colors.black,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(text,
          style: const TextStyle(
            fontFamily: 'Montserrat',
          )),
    ),
  );
}

Widget buildButton(String text, bool isSelected) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: MaterialButton(
        onPressed: () {},
        color: isSelected ? Colors.black : Colors.grey[200],
        textColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
            )),
      ),
    ),
  );
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

class ExerciseInfo extends StatelessWidget {


  final String title;
  final String value;

  const ExerciseInfo(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(value),
      ],
    );
  }
}

