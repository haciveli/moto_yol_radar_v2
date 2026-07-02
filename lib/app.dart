import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class MotoYolRadarApp extends StatelessWidget {
  const MotoYolRadarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moto Yol Radar',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}