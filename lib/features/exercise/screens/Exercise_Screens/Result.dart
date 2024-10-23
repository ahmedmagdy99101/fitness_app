import 'package:fitness_app/features/exercise/widgets/bulidElevatedButton.dart';
import 'package:flutter/material.dart';
import '../../widgets/bulidAppBar.dart';
import '../../widgets/bulidResultCard.dart';
import 'Full Exercise.dart';

final date = DateTime.now();

class Result_Screen extends StatelessWidget {
  const Result_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: buildAppBar("Result",
      () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseScreen()));
      },
      ),
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
                Text("${argument["title"]}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
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
                    bulidResultCard("Total time", "${argument['time']} min",),
                    const SizedBox(width: 10,),
                    bulidResultCard("Total weight", "59 kg"),
                  ],
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    bulidResultCard("Total calories", "${argument['calories']} kcal",),
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




