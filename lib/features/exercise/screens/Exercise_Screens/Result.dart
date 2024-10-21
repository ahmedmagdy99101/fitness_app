import 'package:fitness_app/features/exercise/widgets/bulidElevatedButton.dart';
import 'package:flutter/material.dart';
import '../../widgets/bulidAppBar.dart';
import '../../widgets/bulidResultCard.dart';

final date = DateTime.now();

class Result_Screen extends StatelessWidget {
  const Result_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Result"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
              ],
            ),
            const SizedBox(height: 20,),
            const Text("Workout summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    bulidResultCard("Total time", "00:45 min",),
                    const SizedBox(width: 10,),
                    bulidResultCard("Total weight", "59kg"),
                  ],
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    bulidResultCard("Total calories", "120 kcal",),
                    const SizedBox(width: 10,),
                    bulidResultCard("Heart rate", "115 bmp"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 200,),
            bulidElevatedButton(
                "SAVE",
                (){
                  // TODO
                })
          ],
        ),
      ),
    );
  }
}




