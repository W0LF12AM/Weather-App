import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

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

  Stream<String> getTimeStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      final now = DateTime.now();
      yield DateFormat('HH:mm:ss').format(now);
    }
  }

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
        Container(
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
        const SizedBox(
          height: 80,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Time',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                )),
            //clock
            StreamBuilder<String>(
                stream: getTimeStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading...',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ));
                  }
                  return Text(
                    snapshot.data!,
                    style: GoogleFonts.poppins(
                      fontSize: 64,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  );
                })
          ],
        ),
      ]),
    );
  }
}
