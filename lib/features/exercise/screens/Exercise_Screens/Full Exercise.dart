import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: ExerciseScreen(),
    )
  );
}

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<ExerciseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
            buildExerciseList(),
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

  const Exercise_Card(
      this.image, this.title, this.calories, this.time, this.level);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  child: Image(image: AssetImage(image)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            const Icon(Icons.local_fire_department),
                            Text("$calories KCL"),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('|'),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(Icons.timer),
                            Text("$time min")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                          alignment: Alignment.bottomLeft, child: Text(level))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: const Text(
      'FULL EXERCISE',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bebas',
      ),
    ),
    centerTitle: true,
    // leading: const Icon(Icons.arrow_back),
    leading: IconButton(onPressed: () => {}, icon: const Icon(Icons.arrow_back_ios)),
  );
}

Widget buildButton(String text, bool isSelected) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: MaterialButton(
        onPressed: () {},
        color: isSelected ? Colors.black : Colors.white,
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

Widget buildExerciseList() {
  return Expanded(
      child: ListView(children: [
       GestureDetector(
         onTap: (){},
         child: const Exercise_Card('assets/images/images-removebg-preview 1.png',
          "Exercises With Sitting Dumbbells", 125, 5, "Beginner"),
    ),
  ]));
}
