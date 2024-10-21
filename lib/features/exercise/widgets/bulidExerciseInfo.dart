import 'package:flutter/material.dart';

Widget bulidExerciseInfo(String title, String value){
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      Text(value),
    ],
  );
}