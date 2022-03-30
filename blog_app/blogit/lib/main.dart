import 'package:blogit/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  print('app started');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    print('app started with firebase');

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
      home: const WelcomeScreen(),
    );
  }
}
