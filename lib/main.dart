import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const TechEventApp());
}

class TechEventApp extends StatelessWidget {
  const TechEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechEvent Indonesia',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6558D3)),
      ),
      home: const HomeScreen(),
    );
  }
}
