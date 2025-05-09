import 'package:flutter/material.dart';
import 'package:weather_app/screens/calendar_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/default.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 15),
      child: Container(
          height: 56,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home_filled),
                  color: mainColor,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ));
                  },
                  icon: Icon(Icons.search),
                  color: mainColor,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarScreen()));
                  },
                  icon: Icon(Icons.calendar_month_outlined),
                  color: mainColor,
                  iconSize: 30,
                ),
              ],
            ),
          )),
    );
  }
}
