import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getConversionIcon(String weather, Color color, double size){
  switch(weather){
    case "Clear":{
      return Icon(FontAwesomeIcons.sun, size: size, color: color);
    }
    case "Clouds":{
      return Icon(FontAwesomeIcons.cloud, size: size, color: color);
    }
    case "Rain":{
      return Icon(FontAwesomeIcons.cloudRain, size: size, color: color);
    }
    case "Snow":{
      return Icon(FontAwesomeIcons.snowman, size: size, color: color);
    }
    default:{
      return Icon(FontAwesomeIcons.sun, size: size, color: color);
    }
  }
}