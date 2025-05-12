import 'package:flutter/material.dart';
import 'package:weather_app/widgets/default.dart';

class Bottomnavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Bottomnavbar(
      {super.key, required this.currentIndex, required this.onTap});

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
                  onPressed: () => onTap(0),
                  icon: Icon(Icons.home_filled),
                  color: currentIndex == 0
                      ? mainColor
                      : Colors.white.withOpacity(0.5),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () => onTap(1),
                  icon: Icon(Icons.search),
                  color: currentIndex == 1
                      ? mainColor
                      : Colors.white.withOpacity(0.5),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () => onTap(2),
                  icon: Icon(Icons.calendar_month_outlined),
                  color: currentIndex == 2
                      ? mainColor
                      : Colors.white.withOpacity(0.5),
                  iconSize: 30,
                ),
              ],
            ),
          )),
    );
  }
}
