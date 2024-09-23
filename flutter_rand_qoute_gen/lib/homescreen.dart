import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'saved_quotes_screen.dart';

class RandomQuoteScreen extends StatefulWidget {
  @override
  _RandomQuoteScreenState createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  late String currentQuote;
  List<String> quotes = [];
  Set<String> likedQuotes = {};
  Color bgColor = const Color(0xFF00297F);
  List<Color> bgColors = [
    Colors.blueAccent,
    Colors.deepPurple,
    Colors.teal,
    Colors.pinkAccent
  ];

  @override
  void initState() {
    super.initState();
    loadQuotes();
    loadLikedQuotes();
  }

  Future<void> loadQuotes() async {
    final String response = await rootBundle.loadString('assets/quotes.json');
    final List<dynamic> data = jsonDecode(response);

    setState(() {
      quotes = List<String>.from(data);
      generateRandomQuote();
    });
  }

  Future<void> loadLikedQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      likedQuotes = prefs.getStringList('likedQuotes')?.toSet() ?? {};
    });
  }

  Future<void> saveLikedQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('likedQuotes', likedQuotes.toList());
  }

  void generateRandomQuote() {
    if (quotes.isNotEmpty) {
      final int randomIndex =
          DateTime.now().millisecondsSinceEpoch % quotes.length;

      setState(() {
        currentQuote = quotes[randomIndex];
        bgColor = (bgColors..shuffle()).first;
      });
    }
  }

  void shareQuote() {
    Share.share(currentQuote);
  }

  void toggleLike() {
    setState(() {
      if (likedQuotes.contains(currentQuote)) {
        likedQuotes.remove(currentQuote);
      } else {
        likedQuotes.add(currentQuote);
      }
      saveLikedQuotes();
    });
  }

  void viewSavedQuotes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SavedQuotesScreen(
          likedQuotes: likedQuotes,
          onUnlike: (quote) {
            setState(() {
              likedQuotes.remove(quote);
              saveLikedQuotes();
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quote Generator',
            style: GoogleFonts.lobster(color: Colors.white)),
        backgroundColor: bgColor,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite,
                color: likedQuotes.isNotEmpty ? Colors.red : Colors.white),
            onPressed: viewSavedQuotes,
          ),
        ],
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bgColor.withOpacity(0.6), bgColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: quotes.isEmpty
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      color: Colors.white,
                      margin: const EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            currentQuote,
                            key: ValueKey<String>(currentQuote),
                            style: GoogleFonts.montserrat(
                                fontSize: 20, color: Colors.black87),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: generateRandomQuote,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(150, 50)),
                      ),
                      child: Text(
                        'New Quote',
                        style: GoogleFonts.lato(fontSize: 18, color: bgColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            likedQuotes.contains(currentQuote)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: likedQuotes.contains(currentQuote)
                                ? Colors.red
                                : Colors.white,
                          ),
                          onPressed: toggleLike,
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: shareQuote,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(Icons.share, color: bgColor, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
