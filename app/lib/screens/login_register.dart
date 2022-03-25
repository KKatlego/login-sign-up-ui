import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
// methods
  void validateAndSave() {}

  void moveToRegister() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("WeThinkBlogs_")),
        body: Container(
            margin: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createInputs() + createButtons(),
              ),
            )));
  }

  List<Widget> createInputs() {
    return [
      const SizedBox(height: 10.0),
      logo(),
      const SizedBox(height: 20.0),

      TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
      ),

      const SizedBox(height: 10.0), // spacing

      TextFormField(
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
      )
    ];
  }

  Widget logo() {
    return Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 110.0,
          child: Image.asset('assets/wtc_logo.webp'),
        ));
  }

  List<Widget> createButtons() {
    return [
      ElevatedButton(
        onPressed: validateAndSave,
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        child: const Text('Login', style: TextStyle(fontSize: 20.0)),
      ),
      TextButton(
        onPressed: moveToRegister,
        style: TextButton.styleFrom(primary: Colors.blue),
        child: const Text('Not registered? Sign Up',
            style: TextStyle(fontSize: 20.0)),
      )
    ];
  }
}
