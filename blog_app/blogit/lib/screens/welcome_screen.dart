import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            SizedBox(height: 10.0),
            Text(
              "Welcome to BlogIt",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 3.0),
            Text("Nice to see you, let's get blogging.",
                style: TextStyle(
                    color: Color.fromARGB(255, 114, 114, 114), fontSize: 15.0))
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const Contents(),
    );
  }
}

class Contents extends StatelessWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // total height and width of screen
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.06,
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
                    child: const Text('LOGIN',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (const LoginScreen())));
                    })),
        SizedBox(height: size.height * 0.01),

        // sign up button
        SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.06,
            child:
                // login button
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(221, 17, 17, 17)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: const Text('SIGN UP',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (const RegisterScreen())));
                    })),
      ]),
    );
  }
}
