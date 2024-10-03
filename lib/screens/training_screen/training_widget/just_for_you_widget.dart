import 'package:flutter/material.dart';

class JustForYouWidget extends StatelessWidget {
  const JustForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => justForYouCard(),
        itemCount: 10,
      ),
    );
  }

  Widget justForYouCard() =>
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "assets/images/workout.png",
                      height: 150,
                      width:100,
                      fit: BoxFit.fill,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Be Free',
                        style: const TextStyle(
                            color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.black,
                            size: 10,
                          ),
                          Text(
                            ' 30 min',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ]
            ),
          ),

        ],
      );

}
