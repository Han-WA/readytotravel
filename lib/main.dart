import 'package:flutter/material.dart';
import 'package:travelapp/signup_screen.dart';
import 'package:travelapp/welcome_screen.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF090A3A),
        primaryColorLight: const Color(0xFFC1C1C1),
        fontFamily: "Chivo",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (context) => WelcomeScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
    );
  }
}
