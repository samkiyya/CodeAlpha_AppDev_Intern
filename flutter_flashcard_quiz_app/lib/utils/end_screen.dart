import 'package:flutter/material.dart';
import 'package:flutter_flashcard_quiz_app/hive_storage/database.dart';
import 'package:flutter_flashcard_quiz_app/homepage.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({
    Key? key,
    required this.score,
    required this.db,
  }) : super(key: key);

  final int score;
  final RapidRecallDatabase db;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 3500, // Set the width of the container
          height: 300, // Set the height of the container
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color.fromARGB(
                255, 0, 137, 186), // Set the background color to #007559
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    (score == db.qNa.length)
                        ? "CONGRATS!!! \n You scored $score/${db.qNa.length.toString()}!!"
                        : "Your Final Score is $score/${db.qNa.length.toString()} \n Try Harder!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage()), // Replace YourHomePage with the actual class name of your home page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40), // Increase button size
                    ).copyWith(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 35, 117,
                              0)), // Set the button color to white
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Set text color to #007559
                    ),
                    child: const Text(
                      'Try Again',
                      style: TextStyle(
                        fontSize: 15, // Increase button text size
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
