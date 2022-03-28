import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black),
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
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // email text field
          SizedBox(
            width: size.width * 0.8,
            child: TextField(
                decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Enter email address",
            )),
          ),
          SizedBox(height: size.height * 0.01),
          // password text field
          SizedBox(
            width: size.width * 0.8,
            child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Enter password",
                )),
          ),
          SizedBox(height: size.height * 0.01),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: const Text('LOGIN',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      onPressed: () {})),
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: const Text("Don't have an account? Sign up",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: () {})
        ],
      ),
    );
  }
}
