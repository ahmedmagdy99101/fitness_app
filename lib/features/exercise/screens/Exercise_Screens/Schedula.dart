import 'package:flutter/material.dart';

import '../../../meals/widgets/calender.dart';

final time = TimeOfDay.now();

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

DateTime dateTime = DateTime.now();

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/img.png',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SCHEDULE EXERCISE",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.close,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: const Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 30,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      buildDateSelector(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "Time",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      showTime(context);
                                    },
                                    child:
                                        Text("${time.hour} : ${time.minute}")))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: const Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.add_alert_rounded),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Set Reminder",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9ACD32),
                      // Light green color
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // Handle Next Steps action
                    },
                    child: const Text(
                      'DONE',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )));
  }
}

Widget buildDateSelector() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: HorizontalCalendar(),
  );
}

showTime(context) {
  showTimePicker(context: context, initialTime: time);
}
