import 'package:flutter/material.dart';

class JustForYouWidget extends StatelessWidget {
  const JustForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
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
                      height: 140,
                      width:100,
                      fit: BoxFit.fill,
                    )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Be Free',
                        style: TextStyle(
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
                            style: TextStyle(
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
