import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/widgets/default.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.03),
            child: const Icon(Icons.calendar_today),
          )
        ],
        elevation: 0,
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Center(
              child: Text(
                'Mumbai, India',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Lottie.asset('lib/assets/weather_animation.json'),
            SizedBox(
              height: 20,
            ),
            Text(
              '29° c',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Text(
              'Expect high rain today.',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal, fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.wind_power_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '11km/hr',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.water_drop_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '02%',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '8hr',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(Icons.access_time_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Hourly Forecast',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
