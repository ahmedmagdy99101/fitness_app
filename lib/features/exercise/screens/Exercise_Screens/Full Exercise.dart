import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../widgets/Exercise_Card.dart';
import '../../widgets/bulidAppBar.dart';
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
          channelName: "schedule channel",
          channelDescription: "notifications for schedule exercise",
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

TabController? tabController;

class ExerciseScreen extends StatefulWidget {
   const ExerciseScreen({super.key});

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
      appBar: buildAppBar("FULL EXERCISE",
      () {},
      ),

      body: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              isScrollable: true,
              automaticIndicatorColorAdjustment: true,
              tabs: const [
                Tab(text: 'Strength'),
                Tab(text: 'Full body'),
                Tab(text: 'Cardio & Core'),
                Tab(text: 'Cardio',)
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                  children:
                  [
                    buildExerciseList(context),
                    buildExerciseList(context),
                    buildExerciseList(context),
                    buildExerciseList(context)
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildExerciseList(BuildContext context) {
  return isLoading == true ?
  Center(
    child: LoadingAnimationWidget.waveDots(
        color: Colors.black,
        size: 50),
  )
  : ListView.separated(
      itemCount: data.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
          color: Colors.grey,
        );
      },
      itemBuilder: (context, index) => Exercise_Card(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseDetails_Screen(), settings:
          RouteSettings(arguments:{
            'image' : data[index]["image"],
            'title' : data[index]["title"],
            'calories' :  data[index]["calories"],
            'time' : data[index]["duration"],
            'level' : data[index]["level"],
            'category' : data[index]['category'],
            'description' : data[index]['description'],
            'index' : index
          })));
        },
            image: data[index]["image"],
            title: data[index]["title"],
            level: data[index]["level"],
            time:  data[index]["duration"],
            calories: data[index]["calories"],
            category: data[index]['category'],
            description: data[index]['description'],
      ),
  );
}