import 'package:flutter/material.dart';

final date = DateTime.now();

class Result_Screen extends StatelessWidget {
  const Result_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Text("Workout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Text("Exercises with Sitting Dumbbells", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text("Completed on ${date.day}/${date.month}/${date.year}"),
            const SizedBox(height: 10,),
            const Text("Exercise 3/12"),
            const SizedBox(height: 10,),
            const Text("Workout summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 25,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      bulidCard("Total time", "00:45 min",),
                      const SizedBox(width: 10,),
                      bulidCard("Total weight", "59kg"),
                    ],
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    children: [
                      bulidCard("Total calories", "120 kcal",),
                      const SizedBox(width: 10,),
                      bulidCard("Heart rate", "115 bmp"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 200),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9ACD32), // Light green color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // Handle Next Steps action
                },
                child: const Text(
                  'DONE',
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

AppBar buildAppBar() {
  return AppBar(
    title: const Text(
      'Result',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        fontFamily: 'Bebas',
      ),
    ),
    centerTitle: true,
     leading: const Icon(Icons.arrow_back_ios),
  );
}

Widget bulidCard(String title, String description){
  return Container(
    width: 180,
    height: 100,
    child: Card(
      child: Column(
        children: [
          Text(title , style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          Text(description)
        ],
      ),
    ),
  );
}
