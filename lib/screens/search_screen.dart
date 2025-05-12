// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
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
              child: ListView.builder(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('30°', style: TextStyle(fontSize: 40)),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Jakarta',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.normal)),
                                        Text('Indonesia',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[600])),
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset('lib/assets/sun.png', width: 56),
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
