import 'package:flutter/material.dart';
import 'package:sewa_lapangan/welcome_page.dart';

void main() {
  runApp(const SewaLapangan());
}

class SewaLapangan extends StatelessWidget {
  const SewaLapangan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sewa Lapangan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}
