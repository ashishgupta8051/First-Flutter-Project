import 'dart:ui';

import 'package:first_flutter_project/ui/screens/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Home()
));

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCxr_V0Gk36bY8shGvoPVOiuYR02hiQiRc',
          appId: '1:760589850854:android:a3367f404c6ed5549c0327d',
          messagingSenderId: '760589850854',
          projectId: 'first-flutter-project-c253d')
  );
  runApp(const MaterialApp(home: Home()));
}*/
