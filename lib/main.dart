import 'package:flutter/material.dart';
import 'package:multimedia/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multimedia Algorithms',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Righteous',
        primaryColor: Colors.amber,
        accentColor: Colors.amber,
        cursorColor: Colors.amber,
      ),
      home: HomeScreen(),
    );
  }
}
