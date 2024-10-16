import 'package:fitness_app/features/exercise/screens/Exercise_Screens/Full%20Exercise.dart';
import 'package:flutter/material.dart';
import 'Schedula.dart';
import 'StartTraining_Screen.dart';

List data = ExerciseScreen.passData;

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
                Image.network(
                  '${argument['image']}',
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
                            const Icon(Icons.local_fire_department),
                            const SizedBox(width: 4),
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
                            const Icon(Icons.timer),
                            const SizedBox(width: 4),
                            Text('${argument['time']}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ExerciseInfo('Level','${argument['level']}'),
                      ExerciseInfo('Category','${argument['category']}'),
                      const ExerciseInfo('Weight','Lose'),
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
                  Text(
                    argument['description'],
                    maxLines: 2,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("3 Weeks - 20 Exercise", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
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
                  buildExerciseList(context),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const StartTraining_Screen(), settings:
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

Widget buildExerciseList(BuildContext context) {
  return SizedBox(
      height: 360,
      width: 450,
      child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 1,
              color: Colors.black12,
            );
          },
          itemBuilder: (context, index){
            return Exercise_Card(
              image: data[index]["image"],
              title: data[index]["title"],
              level: data[index]["level"],
              time:  data[index]["duration"],
              calories: data[index]["calories"],
              category: data[index]['category'],
              description: data[index]['description'],
            );
          })
  );
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
  final String? title;
  final String? image;
  final String? calories;
  final String? time;
  final String? level;
  final String? category;
  final String? description;

  const Exercise_Card({
    this.image, this.title, this.calories, this.time, this.level, this.category, this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseDetails_Screen(), settings:
         RouteSettings(arguments:{'image' : image, 'title' : title, 'calories' : calories, 'time' : time, 'level' : level, 'category' : category, 'description' : description})));
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  child: Image(image: NetworkImage(image!)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topLeft,
                        child: Text(
                          title!,
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
                            Text("$calories"),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('|'),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(Icons.timer),
                            Text("$time")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                          alignment: Alignment.bottomLeft, child: Text(level!))
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

