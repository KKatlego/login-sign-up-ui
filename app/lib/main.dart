import 'package:app/screens/login_register.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BlogApp());

class BlogApp extends StatelessWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: "WeThinkBlogs_",

        theme: ThemeData(primarySwatch: Colors.blue),

        home: const LoginRegister(),
        );
  }
}
