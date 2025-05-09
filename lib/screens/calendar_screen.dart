import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weather_app/widgets/bottomNavBar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  final today = DateTime.now();
  final firstDay = DateTime(
    DateTime.now().year,
    DateTime.now().month - 6,
    DateTime.now().day,
  );
  final lastDay = DateTime(
    DateTime.now().year,
    DateTime.now().month + 6,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //calendar picker
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ],
          ),
        ),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TableCalendar(
                focusedDay: today,
                firstDay: firstDay,
                lastDay: lastDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              )),
        )
      ]),
      bottomNavigationBar: Bottomnavbar(),
    );
  }
}
