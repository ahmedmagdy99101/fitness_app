import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({super.key});

  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  DateTime selectedDate = DateTime.now(); // Start with current date
  DateTime currentMonth = DateTime.now(); // Current visible month

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // Month and Year Selector
          _buildMonthSelector(),
          // Horizontal Date List
          _buildDateList(),
        ],
      );
  }

  // Widget for Month Selector with Left/Right arrows
  Widget _buildMonthSelector() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
              });
            },
          ),
          Column(
            children: [
              Text(
                DateFormat('MMMM').format(currentMonth),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'
                ),
              ),
              Text(
                DateFormat('yyyy').format(currentMonth),
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Montserrat'
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              setState(() {
                currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
              });
            },
          ),
        ],
      ),
    );
  }

  // Widget for Horizontal Date List
  Widget _buildDateList() {
    int daysInMonth = DateUtils.getDaysInMonth(currentMonth.year, currentMonth.month);

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: daysInMonth,
        itemBuilder: (context, index) {
          DateTime date = DateTime(currentMonth.year, currentMonth.month, index + 1);
          bool isSelected = selectedDate.day == date.day && selectedDate.month == date.month && selectedDate.year == date.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = date;
              });
            },
            child: Container(
              width: 70,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(date),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,fontFamily: 'Montserrat'
                    ),
                  ),
                  const SizedBox(height: 5),
                  CircleAvatar(
                    backgroundColor: isSelected ? Colors.white : Colors.transparent,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.black,fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}