import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/cardWeather.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> dataCuaca = [
    {"asset": "lib/assets/cloudy.json", "time": "Now", "suhu": "29°"},
    {"asset": "lib/assets/cloudy sun.json", "time": "4 PM", "suhu": "25°"},
    {"asset": "lib/assets/rain.json", "time": "5 PM", "suhu": "21°"},
    {"asset": "lib/assets/sun.json", "time": "6 PM", "suhu": "36°"},
    {"asset": "lib/assets/thunder.json", "time": "7 PM", "suhu": "16°"},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false).loadWeather('Bogor');
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.03),
            child: const Icon(Icons.sunny),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: weatherProvider.isLoading
            ? const CircularProgressIndicator()
            : weatherProvider.weather == null
                ? Text(
                    'Gagal memuat cuaca',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.black),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            '${weatherProvider.weather!.cityName}, ${countryNames[weatherProvider.weather!.countryCode] ?? weatherProvider.weather!.countryCode}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Lottie.asset('lib/assets/rain.json'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          weatherProvider.weather!.temperature.toString() +
                              "°C",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Text(
                          weatherProvider.weather!.description,
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
                                    '${weatherProvider.weather!.windSpeed} m/s',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
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
                                    '${weatherProvider.weather!.humidity}%',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
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
                                    '${weatherProvider.weather!.sunHours} hr',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
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
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 170,
                            child: ListView.builder(
                                itemCount: dataCuaca.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final data = dataCuaca[index];
                                  return Cardweather(
                                    assetsPath: data["asset"]!,
                                    jam: data["time"]!,
                                    suhu: data["suhu"]!,
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
