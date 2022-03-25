// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

void main() => runApp(const BlogApp());

class BlogApp extends StatelessWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "WeThinkBlogs_",
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}
