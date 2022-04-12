import 'package:blogit/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
          'BlogIt',
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
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel(email: '', name: '', uid: '');

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  // String serverResponse = 'Server response';

  @override
  Widget build(BuildContext context) {
    // total height and width of screen
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        SizedBox(child: Text("Hello "+ loggedInUser.name)),
        SizedBox(height: size.height * 0.50),
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
                      logout(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (const WelcomeScreen())));
                    })),
      ]),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  // _makeGetRequest() async {

  //   final url = Uri.parse(_localhost());
  //   Response response = await get(url);

  //   setState(() {
  //     serverResponse = response.body;
  //   });
  // }

  // String _localhost() {
  //   return 'http://localhost:3000/';
  // }

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
