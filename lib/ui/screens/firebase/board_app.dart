import 'package:flutter/material.dart';

class BoardApp extends StatefulWidget {
  const BoardApp({super.key});

  @override
  State<BoardApp> createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {

  @override
  Widget build(BuildContext context) {
    // var firebaseStore = FirebaseFirestore.instance.collection("board").snapshots();

    return Container();

    /*return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
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
          title: const Text("Board App",
              style: TextStyle(
                color: Colors.white,
              ))),
      body: StreamBuilder(stream: firebaseStore, builder: (context, snapshot){
        if(!snapshot.hasData){
          return const CircularProgressIndicator();
        }
        return ListView.builder(itemCount: snapshot.data?.docs.length, itemBuilder: (context, int index){
          return Text(snapshot.data!.docs[index]["title"].toString());
        });
      }),
    );*/
  }
}
