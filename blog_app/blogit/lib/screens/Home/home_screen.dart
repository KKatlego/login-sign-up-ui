import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    // total height and width of screen
    Size size = MediaQuery.of(context).size;
    const String assetName = 'assets/icons/Social_Media_Flatline.svg';

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <
        Widget>[
      const Text(
        "Welcome to BlogIt",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      SizedBox(height: size.height * 0.05),
      SvgPicture.asset(assetName, semanticsLabel: 'Social media'),
      SizedBox(height: size.height * 0.05),
      SizedBox(
          width: size.width * 0.8,
          child:
              // login button
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(104, 225, 253, 1)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: const Text('LOGIN', style: TextStyle(fontSize: 14)),
                  onPressed: () {})),
      // sign up button
      TextButton(
          child: const Text("Dont have an account? Sign up",
              style: TextStyle(fontSize: 15)),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () {}),
    ]);
  }
}
