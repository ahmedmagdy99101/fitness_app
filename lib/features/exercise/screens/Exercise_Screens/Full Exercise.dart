import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ExerciseDetails.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize
    (null,
      [
        NotificationChannel(
          channelKey: "basic key",
          channelName: "test channel",
          channelDescription: "notificaions for test",
          playSound: true,
          channelShowBadge: true,
        )
      ],
      debug: true
  );

  runApp (
       MaterialApp(
        home: ExerciseScreen(),
      )
  );
}

List<QueryDocumentSnapshot> data = [];
bool isLoading = true;

class ExerciseScreen extends StatefulWidget {
   ExerciseScreen({super.key});

static List passData = data;

  @override
  State<ExerciseScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<ExerciseScreen> {

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("exercise").get();
    await Future.delayed(Duration(seconds: 1));
    data.addAll(querySnapshot.docs);
    isLoading = false;
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

Widget buildExerciseList(BuildContext context) {
  return isLoading == true ?
  Expanded(
    child: Center(
      child: LoadingAnimationWidget.waveDots(
          color: Colors.black,
          size: 50),
    ),
  )
  : Expanded(
    child: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            color: Colors.black12,
          );
        },
        itemBuilder: (context, index) => Exercise_Card(
              image: data[index]["image"],
              title: data[index]["title"],
              level: data[index]["level"],
              time:  data[index]["duration"],
              calories: data[index]["calories"],
              category: data[index]['category'],
              description: data[index]['description'],
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

