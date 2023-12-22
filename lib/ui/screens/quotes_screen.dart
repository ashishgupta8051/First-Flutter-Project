import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List<String> quotesList = [
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
    "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
    "Believe you can and you're halfway there. - Theodore Roosevelt",
    "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
    "In three words I can sum up everything I've learned about life: it goes on. - Robert Frost",
    "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
    "It always seems impossible until it's done. - Nelson Mandela",
    "The best way to predict the future is to create it. - Peter Drucker",
    "Life is what happens when you're busy making other plans. - Allen Saunders",
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            debugPrint("Back");
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Change the color of the arrow icon
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
        title: const Text(
          "Quotes List",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.normal),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  const Text(
                    "Quotes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      quotesList[_index],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    ),
                  ))
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Divider(thickness: 1.5)),
            TextButton.icon(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ))),
              onPressed: _showQuote,
              icon: const Icon(
                Icons.wb_sunny,
                color: Colors.white,
              ),
              label: const Text(
                "Inspire me",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      if (quotesList.length == _index + 1) {
        _index = 0;
      } else {
        _index += 1;
      }
    });
  }
}
