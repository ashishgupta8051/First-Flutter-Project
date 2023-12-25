import 'dart:convert';

import 'package:first_flutter_project/model/user_data.dart';
import 'package:first_flutter_project/network/network.dart';
import 'package:first_flutter_project/utils/constant.dart';
import 'package:flutter/material.dart';

class UserDataList extends StatefulWidget {
  const UserDataList({super.key});

  @override
  State<UserDataList> createState() => _UserDataListState();
}

class _UserDataListState extends State<UserDataList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: const Text(
              'UserDataList',
              style: TextStyle(fontSize: 18),
            ),
            automaticallyImplyLeading: true,
            leading: GestureDetector(
              onTap: () {
                debugPrint("Back");
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: FutureBuilder<List<UserData>>(
            future: Network.fetchUserData("${Constant.baseUrl}users"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.yellow,),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final List<UserData> userDatList = snapshot.data!;
                return ListView.builder(
                  itemCount: userDatList.length,
                  itemBuilder: (context, index) {
                    final UserData userData = userDatList[index];
                    return _getUserCard(context, userData);
                  },
                );
              }
            },
          )),
    );
  }

  Widget _getUserCard(BuildContext context, UserData userData) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 4, right: 4, top: 4),
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 4,
          color: Colors.yellowAccent.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${userData.name}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "Phone: ${userData.phone}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                Text(
                  "Email: ${userData.email}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                Text(
                  "Address: ${userData.address.city}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                Text(
                  "Website: ${userData.website}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BottomSheetContent(userData); // Custom widget for bottom sheet content
          },
        );
      },
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  final UserData userData;

  const BottomSheetContent(this.userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Padding(padding: EdgeInsets.only(top: 10), child: Text(
            "FULL ADDRESS",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ))),
          const Padding(padding: EdgeInsets.only(top: 4), child: Divider(height: 0.5)),
          Padding(padding: const EdgeInsets.only(top: 10, left: 10), child: Text(
            "City: ${userData.address.city}",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
          Padding(padding: const EdgeInsets.only(top: 1, left: 10), child: Text(
            "Street: ${userData.address.street}",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
          Padding(padding: const EdgeInsets.only(top: 1, left: 10), child: Text(
            "Geo: ${userData.address.geo}",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
          Padding(padding: const EdgeInsets.only(top: 1, left: 10), child: Text(
            "Suite: ${userData.address.suite}",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
          Padding(padding: const EdgeInsets.only(top: 1, left: 10), child: Text(
            "Zipcode: ${userData.address.zipcode}",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
          const Center(child: Padding(padding: EdgeInsets.only(top: 10), child: Text(
            "COMPANY DETAILS",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ))),
          const Padding(padding: EdgeInsets.only(top: 4), child: Divider(height: 0.5)),
          Padding(padding: const EdgeInsets.only(top: 10, left: 10), child: Text(
            "Company Name: ${userData.company.name}",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
          Padding(padding: const EdgeInsets.only(top: 1, left: 10), child: Text(
            "BS: ${userData.company.bs}",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),
          Padding(padding: const EdgeInsets.only(top: 1, left: 10), child: Text(
            "CatchPhrase: ${userData.company.catchPhrase}",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          )),

        ],
      ),
    );
  }
}
