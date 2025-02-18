import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/widgets/default.dart';

class Cardweather extends StatelessWidget {
  final String assetsPath;
  final String jam;
  final String suhu;

  const Cardweather(
      {super.key,
      required this.assetsPath,
      required this.jam,
      required this.suhu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: secondaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Lottie.asset(assetsPath, width: 80),
              SizedBox(
                height: 5,
              ),
              Text(
                jam,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal, fontSize: 15),
              ),
              Text(
                suhu,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
