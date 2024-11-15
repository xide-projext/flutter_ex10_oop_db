import 'package:flutter/material.dart';
import 'hotel_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Reservation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HotelListScreen(),
    );
  }
}
