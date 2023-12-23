import 'dart:convert';
import 'package:first_flutter_project/model/user_data.dart';
import 'package:first_flutter_project/utils/constant.dart';
import 'package:http/http.dart';
import '../model/forecast_data.dart';

class Network {

  static Future<List<UserData>> fetchUserData(String url) async {
    try {
      final response = await get(Uri.parse(Uri.encodeFull(url)));
      if (response.statusCode == Constant.successful) {
        // Parse List of object
        final List jsonList = jsonDecode(response.body);
        final List<UserData> userDataList = jsonList.map((json) => UserData.fromJson(json)).toList();
        return userDataList;
      } else {
        return throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }


  static Future<ForecastData> fetForecastData(String url) async {
    try{
      final response = await get(Uri.parse(Uri.encodeFull(url)));
      if(response.statusCode == Constant.successful){
        // Parse Object
        final Map<String, dynamic> jsonObj = jsonDecode(response.body);
        final ForecastData forecastData = ForecastData.fromJson(jsonObj);
        return forecastData;
      }else{
        return throw Exception('Failed to load data');
      }
    }catch(e){
      print('Error: $e');
      rethrow;
    }
  }
}
