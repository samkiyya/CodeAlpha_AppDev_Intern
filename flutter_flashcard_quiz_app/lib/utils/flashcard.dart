import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlashCard extends StatelessWidget {
  FlashCard({
    super.key,
    required this.question,
    required this.answer,
    required this.frontColor,
    required this.backColor,
    required this.questionNo,
    required this.onCorrectClick,
    required this.onWrongClick,
  });

  final String questionNo;
  final String question;
  final String answer;
  final Color frontColor;
  final Color backColor;

  VoidCallback onWrongClick;
  VoidCallback onCorrectClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Column(
        children: [
          FlipCard(
            front: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(1, 1))
                ],
                // Remove the border property
                // border: Border.all(width: 2),
                color: frontColor,
                borderRadius: BorderRadius.circular(15), // Add border radius
              ),
              height: 350,
              width: 250,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                      Text(
                        question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          letterSpacing: -1,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
            back: Container(
              decoration: BoxDecoration(
                // Remove the border property
                // border: Border.all(width: 2),
                color: backColor,
                borderRadius: BorderRadius.circular(15), // Add border radius
              ),
              height: 350,
              width: 250,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 14.0,
                        top: 20,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Answer:",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.7),
                        ),
                      ),
                    ),
                    Text(
                      answer,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        letterSpacing: -1,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: onWrongClick,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 2,
                                      offset: Offset(1, 2))
                                ],
                                // Remove the border property
                                // border: Border.all(width: 3),
                                color: const Color.fromARGB(255, 202, 73, 56),
                                borderRadius: BorderRadius.circular(
                                    25), // Add border radius
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'False',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: onCorrectClick,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    offset: Offset(1, 2),
                                    color: Colors.white,
                                  ),
                                ],
                                // Remove the border property
                                // border: Border.all(width: 3),
                                color: Color.fromARGB(255, 0, 143, 122),
                                borderRadius: BorderRadius.circular(
                                    25), // Add border radius
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'True',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
