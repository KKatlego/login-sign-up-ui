import 'package:blogit/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlogIt',
      theme: ThemeData(
          primaryColor: Colors.black, scaffoldBackgroundColor: Colors.white),
      home: const HomeScreen(),
    );
  }
}
