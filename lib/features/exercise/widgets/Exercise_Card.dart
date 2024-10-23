import 'package:flutter/material.dart';

class Exercise_Card extends StatelessWidget {
  final String? title;
  final String? image;
  final String? calories;
  final String? time;
  final String? level;
  final String? category;
  final String? description;
  final GestureTapCallback onTap;

   Exercise_Card(
      {required this.onTap, this.image, this.title, this.calories, this.time, this.level, this.category, this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  child: Image(image: NetworkImage(image!)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topLeft,
                        child: Text(
                          title!,
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            const Icon(Icons.local_fire_department),
                            Text("$calories kcal"),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('|'),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(Icons.timer),
                            Text("$time minutes")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                          alignment: Alignment.bottomLeft, child: Text(level!))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}