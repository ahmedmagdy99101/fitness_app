import 'package:flutter/material.dart';

class WorkoutWidget extends StatelessWidget {
  const WorkoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              workoutCard(),
          itemCount: 10,
        ),
      ),
    );
  }

  Widget workoutCard() =>
      Column(
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
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Row(
            children: [
              Icon(
                Icons.local_fire_department_outlined,
                color: Colors.blueAccent,
                size: 20,
              ),
              Text(
                '135 kcal',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text('  |  '),
              Icon(
                Icons.access_time,
                color: Colors.blueAccent,
                size: 20,
              ),
              Text(
                ' 30 min',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      );

}
