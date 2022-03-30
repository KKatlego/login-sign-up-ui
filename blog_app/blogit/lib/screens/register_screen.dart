import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/user_model.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

// firebase
  final auth = FirebaseAuth.instance;

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
              // name text field
              SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Name",
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      controller: nameController,
                      validator: (value) =>
                          value!.isEmpty ? "Enter your name" : null,
                      // onSaved: (value) => _email = value!)),
                      onSaved: (value) => nameController.text = value!)),
              SizedBox(height: size.height * 0.01),

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
                    textInputAction: TextInputAction.next,
                    controller: passwordController,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
                      value!.isEmpty ? "Password required" : null;
                      if (!regex.hasMatch(value)) {
                        return ("Valid password: 6 or more characters required");
                      }
                    },
                    // onSaved: (value) => _email = value!)),
                    onSaved: (value) => passwordController.text = value!),
              ),
              SizedBox(height: size.height * 0.01),

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
                      hintText: "Confirm Password",
                    ),
                    textInputAction: TextInputAction.done,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (confirmPasswordController.text !=
                          passwordController.text) {
                        return ('Passwords do not match');
                      }
                    },
                    // onSaved: (value) => _email = value!)),
                    onSaved: (value) =>
                        confirmPasswordController.text = value!),
              ),
              SizedBox(height: size.height * 0.01),
              SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.06,
                  child:
                      // SIGN UP button
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
                          child: const Text('SIGN UP',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            validateAndSignUp(emailController.text, passwordController.text);
                          })),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text("Already have an account? Log in",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (const LoginScreen())));
                  })
            ],
          ),
        ));
  }

  void validateAndSignUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postUserToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postUserToFirestore() async {
// firestore

// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
// User? user = _auth.currentUser;
//UserModel userModel = UserModel()

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel(uid: '', name: '', email: '');
// writing all the values
    userModel.uid = user!.uid;
    userModel.email = user.email!;
    userModel.name = nameController.text;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.sendToServer());
    Fluttertoast.showToast(msg: "Account created successfully ");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
// user model

// post user details
  }
}
