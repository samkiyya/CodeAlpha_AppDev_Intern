import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedQuotesScreen extends StatefulWidget {
  final Set<String> likedQuotes;
  final Function(String) onUnlike;

  SavedQuotesScreen({required this.likedQuotes, required this.onUnlike});

  @override
  _SavedQuotesScreenState createState() => _SavedQuotesScreenState();
}

class _SavedQuotesScreenState extends State<SavedQuotesScreen> {
  late Set<String> likedQuotes;

  @override
  void initState() {
    super.initState();
    likedQuotes = widget.likedQuotes;
  }

  void handleUnlike(String quote) {
    widget.onUnlike(quote);
    setState(() {
      likedQuotes.remove(quote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Quotes',
            style: GoogleFonts.lobster(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
      body: likedQuotes.isEmpty
          ? Center(
              child: Text('No liked quotes yet!',
                  style: GoogleFonts.montserrat(fontSize: 18)))
          : ListView.builder(
              itemCount: likedQuotes.length,
              itemBuilder: (context, index) {
                final quote = likedQuotes.elementAt(index);
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Text(
                      quote,
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        handleUnlike(quote);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
