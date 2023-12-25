import 'package:first_flutter_project/ui/screens/personal_details.dart';
import 'package:first_flutter_project/ui/screens/quiz_app.dart';
import 'package:first_flutter_project/ui/screens/quotes_screen.dart';
import 'package:first_flutter_project/ui/screens/split_calculator.dart';
import 'package:first_flutter_project/ui/screens/userdata_list.dart';
import 'package:first_flutter_project/ui/screens/weather_forecast/weather_forecast_screen.dart';
import 'package:first_flutter_project/ui/screens/moviescreens/movie_list.dart';
import 'package:first_flutter_project/ui/widgets/custom_button.dart';
import 'package:first_flutter_project/ui/widgets/scaffold_exaple.dart';
import 'package:flutter/material.dart';

import '../../flutter_google_map/googleMap.dart';
import '../../flutter_google_map/quake_app.dart';

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
      "Network Calling Screen",
      "Weather Forecast Screen",
      "Google Map Integration",
      "Quakes Screen"
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const PersonalDetails()));
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
                      case 7:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const UserDataList()));
                        break;
                      }
                      case 8:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const WeatherForecastScreen()));
                        break;
                      }
                      case 9:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const GoogleMapIntegration()));
                        break;
                      }
                      case 10:{
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const QuakeApp()));
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
