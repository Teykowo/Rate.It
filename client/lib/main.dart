// Import external packages.
import 'package:flutter/material.dart';
// Import pages.
import 'package:client/screens/home.dart';

// Flutter uses the runApp function to inflate (display) the given widget on the screen.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue.shade800,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

