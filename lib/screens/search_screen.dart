// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/models/loc_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<LocModel> _kotakota = [];

  final List<String> kotakota = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Medan',
    'Makassar',
    'Semarang',
    'Palembang',
    'Batam',
    'Denpasar',
    'Yogyakarta'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadKotakota();
  }

  Future<void> _loadKotakota() async {
    final provider = Provider.of<WeatherProvider>(context, listen: false);
    List<CityModel> kotakotaList = [];
    
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    final cities = provider.searchedCities;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                if (value.length > 2) {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .searchCities(value);
                }
              },
              decoration: InputDecoration(
                hintText: 'Search city...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            // card of cities

            Expanded(
              child: provider.isSearching
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('30°',
                                              style: TextStyle(fontSize: 40)),
                                          SizedBox(width: 16),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Jakarta',
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              Text('Indonesia',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[600])),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Image.asset('lib/assets/sun.png',
                                          width: 56),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
