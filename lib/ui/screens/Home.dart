import 'package:first_flutter_project/ui/screens/BizCard.dart';
import 'package:first_flutter_project/ui/screens/QuizApp.dart';
import 'package:first_flutter_project/ui/screens/QuotesScreen.dart';
import 'package:first_flutter_project/ui/screens/SplitCalculator.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/MovieList.dart';
import 'package:first_flutter_project/ui/widgets/CustomButton.dart';
import 'package:first_flutter_project/ui/widgets/ScaffoldExaple.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> screenList = [
      "Biz Card Screen",
      "Quotes Screen",
      "Split Calculator Screen",
      "Quiz Screen",
      "Movies Screen",
      "Custom Buttons Screen",
      "Scaffold Example Screen",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Home",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: screenList.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                elevation: 5,
                color: Colors.blueAccent.shade400,
                child: ListTile(
                  title: Text(
                    screenList[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                  onTap: (){
                    switch(index){
                      case 0:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const BizCard()));
                        break;
                      }
                      case 1:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const QuotesScreen()));
                        break;
                      }
                      case 2:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SplitCalculator()));
                        break;
                      }
                      case 3:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const QuizApp()));
                        break;
                      }
                      case 4:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MovieList()));
                        break;
                      }
                      case 5:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CustomButton()));
                        break;
                      }
                      case 6:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ScaffoldExample()));
                        break;
                      }
                    }
                  },
                ),
              );
            }),
      ),
    );
  }
}
