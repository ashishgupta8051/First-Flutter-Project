import 'package:first_flutter_project/model/forecast_data.dart';
import 'package:first_flutter_project/network/network.dart';
import 'package:first_flutter_project/ui/widgets/conversionicon.dart';
import 'package:first_flutter_project/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/util.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String cityName = "Mumbai";

  @override
  void initState() {
    super.initState();
    /*   _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        String query = _textEditingController.text;
        if (query.isNotEmpty) {
          getWeather(query);
        }
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("widget");
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
            backgroundColor: Colors.blueAccent,
            centerTitle: false,
            title: const Text(
              "Weather Forecast",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            )),
        body: ListView(
          children: [
            textField(),
            Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<ForecastData>(
                    future: getWeather(cityName),
                    builder: (BuildContext context,
                        AsyncSnapshot<ForecastData> snapshot) {
                      /*      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: Colors.blueAccent),
                        );
                      } else*/
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            midView(snapshot.data!),
                            getBottomView(context, snapshot.data!),
                          ],
                        );
                      } else {
                        return const SizedBox(); // Handle other states if needed
                      }
                    }))
          ],
        ));
  }

  Widget textField() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: TextField(
          focusNode: _focusNode,
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: "Enter city name",
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              cityName = value;
              getWeather(cityName);
              _textEditingController.clear();
            });
          },
        ),
      ),
    );
  }

  Widget midView(ForecastData forecastData) {
    return Column(
      children: [
        Text(
          "${forecastData.city.name},${forecastData.city.country}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(Util.getDateTimeFormat(forecastData.city.timezone),
            style: const TextStyle(fontSize: 14, color: Colors.black)),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: getConversionIcon(
                forecastData.list[0].weather[0].main, Colors.pinkAccent, 190)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${forecastData.list[0].temp.day.toStringAsFixed(0)} °F",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Text(forecastData.list[0].weather[0].description.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                )),
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "${forecastData.list[0].speed.toStringAsFixed(1)} mi/h",
                        style: const TextStyle(fontSize: 14)),
                    const Icon(FontAwesomeIcons.wind,
                        size: 20, color: Colors.brown)
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${forecastData.list[0].humidity.toStringAsFixed(0)} %",
                            style: const TextStyle(fontSize: 14)),
                        const Icon(FontAwesomeIcons.solidGrinBeamSweat,
                            size: 20, color: Colors.brown)
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "${forecastData.list[0].temp.max.toStringAsFixed(0)} °F",
                        style: const TextStyle(fontSize: 14)),
                    const Icon(FontAwesomeIcons.temperatureHigh,
                        size: 20, color: Colors.brown)
                  ],
                ),
              ],
            )),
      ],
    );
  }

  Widget getBottomView(BuildContext context, ForecastData forecastData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(top: 20)),
        const Text("7-Days Weather Forecast",
            style: TextStyle(fontSize: 14, color: Colors.black87)),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          margin: const EdgeInsets.only(left: 10),
          height: 150,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff9661c3), Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight)),
                      child: forecastCard(context, forecastData, index),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: forecastData.list.length),
        )
      ],
    );
  }

  Widget forecastCard(
      BuildContext context, ForecastData forecastData, int index) {
    String dayOfWeek = "";
    String fullDate = Util.getDateTimeFormat(forecastData.list[index].dt);
    dayOfWeek = fullDate.split(",")[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(dayOfWeek,
              style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.white,
                    child: getConversionIcon(
                        forecastData.list[index].weather[0].main,
                        Colors.pinkAccent,
                        45),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                  "${forecastData.list[0].temp.min.toStringAsFixed(0)} °F",
                                  style: const TextStyle(fontSize: 14)),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              const Icon(
                                  FontAwesomeIcons.solidArrowAltCircleDown,
                                  size: 16,
                                  color: Colors.white)
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "${forecastData.list[0].temp.max.toStringAsFixed(0)} °F",
                                  style: const TextStyle(fontSize: 14)),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              const Icon(FontAwesomeIcons.solidArrowAltCircleUp,
                                  size: 16, color: Colors.white)
                            ],
                          ),
                          Text(
                              "Hum ${forecastData.list[0].humidity.toStringAsFixed(0)} %",
                              style: const TextStyle(fontSize: 14)),
                          Text(
                              "Win ${forecastData.list[0].speed.toStringAsFixed(1)} mi/h",
                              style: const TextStyle(fontSize: 14)),
                        ],
                      )),
                ],
              ),
            )
          ],
        ))
      ],
    );
  }

  Future<ForecastData> getWeather(String cityName) {
    return Network.fetForecastData(Constant.getForecastBaseUrl(cityName));
  }
}
