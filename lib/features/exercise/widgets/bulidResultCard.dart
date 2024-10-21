import 'package:flutter/material.dart';

Widget bulidResultCard(String title, String description){
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