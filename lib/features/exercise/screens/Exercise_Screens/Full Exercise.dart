import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/Exercise_Card.dart';
import '../../widgets/bulidAppBar.dart';
import 'ExerciseDetails.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

List<QueryDocumentSnapshot> data = [];

List<String> tabList = ['Strength', 'Full body', 'Stretch', 'Cardio & Core', 'Cardio', 'Core', 'Gym', 'Yoga'];

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
        length: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                controller: tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                //splashBorderRadius: BorderRadius.circular(10),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                dividerColor: Colors.white,
                indicator: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                isScrollable: true,
                automaticIndicatorColorAdjustment: true,
                tabs:  [
                  Tab(text: tabList[0],),
                  Tab(text: tabList[1],),
                  Tab(text: tabList[2],),
                  Tab(text: tabList[3],),
                  Tab(text: tabList[4],),
                  Tab(text: tabList[5],),
                  Tab(text: tabList[6],),
                  Tab(text: tabList[7],)
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  buildExerciseList(tabList[0]),
                  buildExerciseList(tabList[1]),
                  buildExerciseList(tabList[2]),
                  buildExerciseList(tabList[3]),
                  buildExerciseList(tabList[4]),
                  buildExerciseList(tabList[5]),
                  buildExerciseList(tabList[6]),
                  buildExerciseList(tabList[7]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildExerciseList(String tab) {
  List selectedList = [];
  if (isLoading == true){
    return Center(
      child: LoadingAnimationWidget.waveDots(
          color: Colors.black,
          size: 50),
    );
  }
  for (int i=0; i<data.length; i++){
    if (tab == data[i]['category']){
      selectedList.add(data[i]);
    }
  }
  return ListView.separated(
    itemCount: selectedList.length,
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
          'image' : selectedList[index]["image"],
          'title' : selectedList[index]["title"],
          'calories' :  selectedList[index]["calories"],
          'time' : selectedList[index]["duration"],
          'level' : selectedList[index]["level"],
          'category' : selectedList[index]['category'],
          'description' : selectedList[index]['description'],
          'index' : index
        })));
      },
      image: selectedList[index]["image"],
      title: selectedList[index]["title"],
      level: selectedList[index]["level"],
      time:  selectedList[index]["duration"],
      calories: selectedList[index]["calories"],
      category: selectedList[index]['category'],
      description: selectedList[index]['description'],
    ),
  );
}