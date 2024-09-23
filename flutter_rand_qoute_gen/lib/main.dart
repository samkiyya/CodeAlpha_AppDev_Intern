import 'package:flutter/material.dart';
import 'package:flutter_rand_qoute_gen/homescreen.dart';

void main() => runApp(RandomQuoteApp());

class RandomQuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote Generator',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.deepPurple),
          bodyLarge: TextStyle(color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple,
          ),
        ),
      ),
      home: RandomQuoteScreen(),
    );
  }
}
