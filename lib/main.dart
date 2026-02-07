import 'package:flutter/material.dart';
import 'package:grimorio/screens/splash.dart';

void main() {
  runApp(const Grimorio());
}

class Grimorio extends StatelessWidget {
  const Grimorio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grimório",
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
