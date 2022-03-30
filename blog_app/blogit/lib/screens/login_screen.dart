// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';
import 'register_screen.dart';

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

class Contents extends StatefulWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  // form key
  final _formKey = GlobalKey<FormState>();

// Controllers
// Text field updates value and the controller notifies its listeners
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// firebase

  final auth = FirebaseAuth.instance;

  // String _email = "";
  // String _password = "";

  bool validateAndSave() {
    //accessing form via formkey
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  // void validateAndSubmit() {
  //   if (validateAndSave()) {
  //     // UserCredential user = await FirebaseAuth.instance
  //     //     .signInWithEmailAndPassword(email: _email, password: _password);
  //     print('valid user');
  //   } else {
  //     print('user not found');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // email text field
              SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Email address",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      validator: (value) =>
                          value!.isEmpty ? "Email required" : null,
                      // onSaved: (value) => _email = value!)),
                      onSaved: (value) => emailController.text = value!)),
              SizedBox(height: size.height * 0.01),
              // password text field
              SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
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
                        hintText: "Password",
                      ),
                      textInputAction: TextInputAction.done,
                      controller: passwordController,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        value!.isEmpty ? "Password required" : null;
                        if (!regex.hasMatch(value)) {
                          return ("Valid password: 6 or more characters required");
                        }
                        return null;
                      },
                      // onSaved: (value) => _password = value!)),
                      onSaved: (value) => passwordController.text = value!)),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: const Text('LOGIN',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            validateAndSignIn(
                                emailController.text, passwordController.text);
                          })),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text("Don't have an account? Sign up",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (const RegisterScreen())));
                  })
            ],
          ),
        ));
  }

  void validateAndSignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Login successful'),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
