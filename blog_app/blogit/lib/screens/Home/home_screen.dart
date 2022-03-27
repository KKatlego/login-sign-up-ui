import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import 'components/contents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Contents(),
    );
  }
}

class Contents extends StatelessWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // total height of width of screen
    Size size = MediaQuery.of(context).size;
    const String assetName =
        '/Users/katlego/WeThinkCode/projects/blog-app/blog_app/blogit/assets/icons/Social_Media_Flatline.svg';

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Welcome to BlogIt",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // Text("hi")
        SvgPicture.asset(assetName, semanticsLabel: 'Social media')
      ],
    ));
  }
}
