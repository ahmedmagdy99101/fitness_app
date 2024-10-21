import 'package:fitness_app/features/exercise/screens/Exercise_Screens/Full%20Exercise.dart';
import 'package:fitness_app/features/exercise/screens/Exercise_Screens/StartTraining_Screen.dart';
import 'package:fitness_app/features/exercise/widgets/bulidElevatedButton.dart';
import 'package:flutter/material.dart';
import '../../widgets/bulidExerciseInfo.dart';
import '../../widgets/bulidScheduleButton.dart';
import 'Schedula.dart';
import '../../widgets/Exercise_Card.dart';


class ExerciseDetails_Screen extends StatefulWidget {
  const ExerciseDetails_Screen({super.key});

  @override
  State<ExerciseDetails_Screen> createState() => _ExerciseDetails_ScreenState();
}

class _ExerciseDetails_ScreenState extends State<ExerciseDetails_Screen> {

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments as Map;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                        bulidExerciseInfo('Level','${argument['level']}'),
                        bulidExerciseInfo('Category','${argument['category']}'),
                        bulidExerciseInfo('Weight','Lose'),
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
                        scheduleButton("Schedule", () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Schedule(),settings: RouteSettings(
                              arguments: argument['image'])));
                        },)
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text("Exercise Program", textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      splashBorderRadius: BorderRadius.circular(10),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      // indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.white,
                      indicator: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      automaticIndicatorColorAdjustment: true,
                      tabs: const [
                        Tab(text: 'Cardio'),
                        Tab(text: 'Legs'),
                        Tab(text: 'Back'),
                        Tab(text: 'Chest',)
                      ],
                    ),
                    buildExerciseList(context),
                  ],
                ),
              ),
              bulidElevatedButton(
                  "START NOW",
                  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StartTraining_Screen(), settings:
                    RouteSettings(arguments: {'image' : argument['image'], 'title' : argument['title']})));
                  })
            ],
          ),
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
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 1,
              color: Colors.black12,
            );
          },
          itemBuilder: (context, index){
            return Exercise_Card(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseDetails_Screen(), settings:
                RouteSettings(arguments:{'image' : data[index]["image"], 'title' : data[index]["title"], 'calories' :  data[index]["calories"], 'time' : data[index]["duration"], 'level' : data[index]["level"], 'category' : data[index]['category'], 'description' : data[index]['description']})));
              },
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



