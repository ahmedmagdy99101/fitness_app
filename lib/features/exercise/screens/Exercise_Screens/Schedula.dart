import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../../../meals/widgets/calender.dart';

TimeOfDay selectTime = TimeOfDay.now();
DateTime scheduleTime = DateTime.now();
bool reminder = true;

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "SCHEDULE EXERCISE",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close))
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
                                    onPressed: () async{
                                      final TimeOfDay? timeOfDay = await showTimePicker(
                                        context: context,
                                        initialTime: selectTime,
                                        initialEntryMode: TimePickerEntryMode.dial,
                                      );
                                      if (timeOfDay == null) return;

                                       setState(() {
                                          selectTime = timeOfDay;
                                        });

                                    },
                                    child:
                                        Text("${selectTime.hour.toString().padLeft(2,'0')} : ${selectTime.minute.toString().padLeft(2,'')}")))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Row(
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
                                ),
                              ),
                              Transform.scale(
                                scale: 1,
                                child: Switch(
                                    value: reminder,
                                    onChanged: (value){
                                      setState(() {
                                        reminder = value;
                                      });
                                    }),
                              ),
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
                      if (reminder == true) {
                      AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            id: 10,
                            channelKey: "basic key",
                            actionType: ActionType.Default,
                            title: 'Hello World!',
                            body: 'This is my first notification!',
                          ),
                        schedule: NotificationCalendar(
                            day: scheduleTime.day,
                            month: scheduleTime.month,
                             year: scheduleTime.year,
                             hour: selectTime.hour,
                             minute: selectTime.minute,
                        )
                      );
                      Navigator.pop(context);
                    } else {
                        Navigator.pop(context);
                      }
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




