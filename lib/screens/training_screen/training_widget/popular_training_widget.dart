import 'package:flutter/material.dart';

class PopularTrainingWidget extends StatelessWidget {
  const PopularTrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            popularTrainingCard(),
        itemCount: 10,
      ),
    );
  }

  Widget popularTrainingCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  "assets/images/workout.png",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            Text(
              'Green beans, tomatoes, eggs',
              style: const TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  Icons.local_fire_department_outlined,
                  color: Colors.blueAccent,
                  size: 20,
                ),
                Text(
                  '135 kcal',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text('  |  '),
                Icon(
                  Icons.access_time,
                  color: Colors.blueAccent,
                  size: 20,
                ),
                Text(
                  ' 30 min',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

          ],
        ),
      );

}
