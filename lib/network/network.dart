import 'dart:convert';
import 'package:first_flutter_project/model/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Network {

  static Future<List<UserData>> fetchUserData(String url) async {
    try {
      final response = await get(Uri.parse(Uri.encodeFull(url)));
      if (response.statusCode == 200) {
        // Parse Object
        // final Map<String, dynamic> jsonObj = jsonDecode(response.body);
        // final UserData userData = UserData.fromJson(jsonObj);
        // Parse List of Objects
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
}
