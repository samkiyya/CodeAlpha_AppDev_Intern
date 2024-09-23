import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_flashcard_quiz_app/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;
  String _loadingText = 'Loading your quiz experience...';

  @override
  void initState() {
    super.initState();

    // Start fade-out effect before navigation
    Timer(Duration(seconds: 2), () {
      setState(() {
        _opacity = 0.0;
      });
    });

    // Change loading text dynamically
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == 1) {
        setState(() {
          _loadingText = 'Almost there...';
        });
      } else if (timer.tick == 2) {
        setState(() {
          _loadingText = 'Get ready to quiz!';
        });
      } else if (timer.tick >= 3) {
        timer.cancel(); // Stop the timer after 3 updates
      }
    });

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 177, 205),
              Color.fromARGB(255, 0, 137, 186),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/logo1.png',
                    height: 250,
                    width: 250,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'SAMKIYYA Quiz App!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  _loadingText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
