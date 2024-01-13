import 'dart:ui';

import 'package:first_flutter_project/ui/screens/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home()
));

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDmLQkQCj_NcjF7zAB7vQPVGANoRIndn8U',
          appId: '1:523111598633:android:455b507b4fc38b4fc9aa38',
          messagingSenderId: '523111598633',
          projectId: 'flutter-first-app-79d23')
  );
  runApp(const MaterialApp(home: Home()));
}*/
