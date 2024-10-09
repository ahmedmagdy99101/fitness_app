import 'package:flutter/material.dart';

class PopularTrainingWidget extends StatelessWidget {
  const PopularTrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => popularTrainingCard(),
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
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            const Text(
              'Green beans, tomatoes, eggs',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const Row(
              children: [
                Icon(
                  Icons.local_fire_department_outlined,
                  color: Colors.blueAccent,
                  size: 14,
                ),
                Text(
                  '135 kcal',
                  style: TextStyle(
                      color: Color(0xFF303841),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text('  |  '),
                Icon(
                  Icons.access_time,
                  color: Colors.blueAccent,
                  size: 14,
                ),
                Text(
                  ' 30 min',
                  style: TextStyle(
                      color: Color(0xFF303841),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      );
}
