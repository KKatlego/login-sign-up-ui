import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const Contents(),
    );
  }
}

class Contents extends StatefulWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  String serverResponse = 'Server response';
  @override
  Widget build(BuildContext context) {
    // total height and width of screen
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        const SizedBox(child: Text('blogs')),
        SizedBox(height: size.height * 0.02),
        SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.06,
            child:
                // login button
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(221, 172, 172, 172)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: const Text('Click here to connect to server',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      print('hello');
                      _makeGetRequest();
                    })),
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
                    child: const Text('LOGOUT',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (const WelcomeScreen())));
                    })),
      ]),
    );
  }

  _makeGetRequest() async {

    final url = Uri.parse(_localhost());
    Response response = await get(url);

    setState(() {
      serverResponse = response.body;
    });
  }

  String _localhost() {
    return 'http://localhost:3000/';
  }

  // _makeGetRequest() async {
  //     print("almost in");

  //   final response = await http.get(Uri.parse("http://localhost:3000"));
  //   if (response.statusCode == 200) {
  //     return (response.body);
  //     print("in");
  //   } else {
  //     throw Exception("Failed to get blogs");
  //   }
  // }
}
