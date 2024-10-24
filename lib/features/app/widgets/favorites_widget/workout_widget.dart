import 'package:flutter/material.dart';

class WorkoutWidget extends StatelessWidget {
  final List<Workout> workouts;

  const WorkoutWidget({Key? key, required this.workouts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              workoutCard(workouts[index]),
          itemCount: workouts.length,
        ),
      ),
    );
  }

  Widget workoutCard(Workout workout) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          workout.imagePath,
          height: 200,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      Text(
        workout.name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        children: [
          const Icon(
            Icons.local_fire_department_outlined,
            color: Colors.blueAccent,
            size: 20,
          ),
          Text(
            workout.calories,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const Text('  |  '),
          const Icon(
            Icons.access_time,
            color: Colors.blueAccent,
            size: 14,
          ),
          Text(
            workout.time,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 40,
      ),
    ],
  );
}


class Workout {
  final String imagePath;
  final String name;
  final String calories;
  final String time;

  Workout({
    required this.imagePath,
    required this.name,
    required this.calories,
    required this.time,
  });
}
