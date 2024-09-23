import 'package:flutter/material.dart';
import 'package:flutter_flashcard_quiz_app/homepage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Adjust font sizes based on screen width and height
    double welcomeFontSize =
        screenWidth < 400 ? 24 : 32; // Smaller font for small screens
    double subtitleFontSize = screenWidth < 400 ? 16 : 20;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0089BA),
              Color(0xFF00B4D8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                ClipOval(
                  child: Image.asset(
                    'assets/imageLogo.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 30),

                // Welcome Text
                Text(
                  'Discover your genius with SAMKIYYA Quiz!',
                  style: TextStyle(
                    fontSize: welcomeFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black54,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),

                // Subtitle Text
                Text(
                  'Prepare to challenge yourself and expand your knowledge with our exciting quizzes!',
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Start Quiz Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to home page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 60),
                    backgroundColor: const Color(0xFF00B4D8),
                    foregroundColor: Colors.white,
                    shadowColor: Colors.black45,
                    elevation: 10,
                  ),
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
