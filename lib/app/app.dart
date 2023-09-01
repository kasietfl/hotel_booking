import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/screens/hotel.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'SfProDisplay'),
      home: const HotelScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
