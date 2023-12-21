import 'package:flutter/material.dart';

import '../../model/QuizItem.dart';
import '../../utils/HexColor.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final Color _grey = HexColor("#808080");

  int questionIndex = 0;
  int questionNumber = 1;

  List<QuizItem> indiaQuizList = [
    QuizItem.name('The national animal of India is the Elephant.', false),
    QuizItem.name(
        'The Indian Ocean is the only ocean that borders India.', false),
    QuizItem.name(
        'The Red Fort in Delhi was built during the Mughal era.', true),
    QuizItem.name('The official name of India is the Republic of India.', true),
    QuizItem.name('The Lotus Temple in Delhi is a famous Hindu temple.', false),
    QuizItem.name(
        'The Indian Premier League (IPL) is a professional football league.',
        false),
    QuizItem.name(
        'The currency notes in India feature a portrait of Mahatma Gandhi.',
        true),
    QuizItem.name('The national flower of India is the Rose.', false),
    QuizItem.name('India is the world\'s second-most populous country.', true),
    QuizItem.name(
        'The state of Goa is located on the eastern coast of India.', false),
    QuizItem.name(
        'The Indian flag has three horizontal stripes of equal width, with saffron at the top.',
        true),
    QuizItem.name(
        'Bollywood is the term used for the Indian film industry based in Kolkata.',
        false),
    QuizItem.name('The Taj Mahal is a UNESCO World Heritage Site.', true),
    QuizItem.name(
        'The festival of Holi is often referred to as the "Festival of Colors."',
        true),
    QuizItem.name(
        'The Thar Desert is located in the northern part of India.', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        centerTitle: true,
        backgroundColor: _grey.withOpacity(1),
        title: const Text(
          "Quiz App",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/india.png",
              width: 250,
              height: 180,
            ),
            Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                    color: _grey,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white30, width: 1)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: Text(
                        "Question $questionNumber",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    Expanded(
                        child: Center(
                            child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Text(
                        indiaQuizList[questionIndex].question,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    )))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      elevation: 0.0,
                      minWidth: 50,
                      height: 40,
                      color: _grey,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.navigate_before,
                            // Replace with your image
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          if (questionNumber != 1) {
                            questionIndex--;
                            questionNumber--;
                          }
                        });
                      },
                    ),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      elevation: 0.0,
                      minWidth: 110.0,
                      height: 40,
                      color: _grey,
                      child: const Text('Ture',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          bool checked = indiaQuizList[questionIndex].isTrue;
                          String value;
                          bool isCondition;
                          if (checked) {
                            value = "Correct";
                            isCondition = true;
                          } else {
                            value = "Incorrect";
                            isCondition = false;
                          }
                          var shackBar = SnackBar(
                            duration: const Duration(seconds: 1),
                            content: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      isCondition ? Colors.green : Colors.red),
                            ),
                            backgroundColor: Colors.white,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(shackBar);
                        });
                      },
                    ),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      elevation: 0.0,
                      minWidth: 110.0,
                      height: 40,
                      color: _grey,
                      child: const Text('False',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          bool checked = indiaQuizList[questionIndex].isTrue;
                          String value;
                          bool isCondition;
                          if (!checked) {
                            value = "Correct";
                            isCondition = true;
                          } else {
                            value = "Incorrect";
                            isCondition = false;
                          }
                          var shackBar = SnackBar(
                            duration: const Duration(seconds: 1),
                            content: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      isCondition ? Colors.green : Colors.red),
                            ),
                            backgroundColor: Colors.white,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(shackBar);
                        });
                      },
                    ),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      elevation: 0.0,
                      minWidth: 50,
                      height: 40,
                      color: _grey,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.navigate_next_outlined,
                            // Replace with your image
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          if (indiaQuizList.length == questionIndex + 1) {
                            questionIndex = 0;
                            questionNumber = 1;
                          } else {
                            questionIndex++;
                            questionNumber++;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
