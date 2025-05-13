import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/cardWeather.dart';
import 'package:weather_app/widgets/weather_icon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final weatherProvider =
          Provider.of<WeatherProvider>(context, listen: false);
      weatherProvider.loadWeather('Bogor');
      weatherProvider.fetchHourlyWeather('Bogor');
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void didChangeAppLifeCycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      Future.microtask(() {
        final weatherProvider =
            Provider.of<WeatherProvider>(context, listen: false);
        weatherProvider.loadWeather('Bogor');
        weatherProvider.fetchHourlyWeather('Bogor');
        print('App resumed');
      });
    }
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
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
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
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Lottie.asset(getWeatherIcon(
                            weatherProvider.weather!.description)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${weatherProvider.weather!.temperature.round()}°C',
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
                                'Next Forecast',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Consumer<WeatherProvider>(
                            builder: (context, provider, child) {
                          if (provider.hourlyWeather.isEmpty) {
                            return Center(
                              child: Text(
                                'No hourly data available',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 160,
                              child: ListView.builder(
                                  itemCount: provider.hourlyWeather.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final forecast =
                                        provider.hourlyWeather[index];
                                    final iconPath =
                                        getWeatherIcon(forecast.description);
                                    return Cardweather(
                                      assetsPath: iconPath,
                                      jam: forecast.dateTime.hour.toString() +
                                          ':00',
                                      suhu: '${forecast.temperature.round()}°C',
                                    );
                                  }),
                            );
                          }
                        })
                        // SizedBox(
                        //   height: 140,
                        //   child: weatherProvider.isLoading
                        //       ? Center(
                        //           child: CircularProgressIndicator(),
                        //         )
                        //       : Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 10),
                        //           child: SizedBox(
                        //             height: 170,
                        //             child: ListView.builder(
                        //                 itemCount: weatherProvider
                        //                     .hourlyWeather.length,
                        //                 scrollDirection: Axis.horizontal,
                        //                 itemBuilder: (context, index) {
                        //                   final forecast = weatherProvider
                        //                       .hourlyWeather[index];
                        //                   final iconPath = getWeatherIcon(
                        //                       forecast.description);
                        //                   return Cardweather(
                        //                     assetsPath: iconPath,
                        //                     jam: forecast.dateTime.hour
                        //                         .toString(),
                        //                     suhu:
                        //                         '${forecast.temperature.round()}°C',
                        //                   );
                        //                 }),
                        //           ),
                        //         ),
                        // )
                      ],
                    ),
                  ),
      ),
    );
  }
}
