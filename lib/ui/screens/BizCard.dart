import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BizCard extends StatelessWidget {
  const BizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            debugPrint("Back");
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black, // Change the color of the arrow icon
          ),
        ),
        backgroundColor: Colors.yellow,
        title: const Text("Biz Card"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      height: 200,
      width: 350,
      margin: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(
                0.0,
                0.0,
              ),
              blurRadius: 14.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ashish Gupta",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Email: "),
              Text("ashishgupta8051@gmail.com"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              Text("6265257963"),
            ],
          ),
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.red, width: 1.2),
          image: const DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              fit: BoxFit.cover)),
    );
  }
}

class MyClickableText extends StatelessWidget {
  final String url;

  const MyClickableText(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '',
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: url,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(url);
              },
          ),
        ],
      ),
    );
  }

  launch(String url2) async {
    final Uri url2 = Uri.parse(url);
    await launchUrl(url2);
    if (!await launchUrl(url2)) {
      // throw Exception('Could not launch $_url2');
    }
  }
}
