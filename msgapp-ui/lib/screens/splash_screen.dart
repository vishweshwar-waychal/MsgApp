import 'dart:async';
import 'package:flutter/material.dart';
import 'package:msgapp/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Screen duration 1s
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,

      // Logo
      body: Center(
        child: SizedBox(
          width: width * 0.4,
          height: width * 0.4,
          child: Image.asset('lib/assets/images/logo_new.png'),
        ),
      ),
    );
  }
}
