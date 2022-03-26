import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

enum FormType { login, register }

class _LoginRegisterState extends State<LoginRegister> {
  final formKey = GlobalKey<FormState>();
  FormType _formType = FormType.login;

  // storing the user email and password
  String _email = "";
  String _password = "";

  // methods
  bool validateAndSave() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void moveToRegister() {
    formKey.currentState!.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState!.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

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

      // Email field
      TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please provide an email address';
            }
            return null;
          },
          onSaved: (value) {
            _email = value!; // save the email to the value
          }),

      const SizedBox(height: 10.0), // spacing

      // Password field
      TextFormField(
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          return null;
        },
        onSaved: (value) {
          _password = value!; // save the password to the value
        },
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
    if (_formType == FormType.login) {
      return [
        ElevatedButton(
          onPressed: validateAndSave,
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          child: const Text('Login', style: TextStyle(fontSize: 20.0)),
        ),
        TextButton(
          onPressed: moveToRegister,
          style: TextButton.styleFrom(primary: Colors.red),
          child: const Text('Not registered? Sign Up',
              style: TextStyle(fontSize: 20.0)),
        )
      ];
    } else {
      return [
        ElevatedButton(
          onPressed: validateAndSave,
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          child: const Text('Create account', style: TextStyle(fontSize: 20.0)),
        ),
        TextButton(
          onPressed: moveToLogin,
          style: TextButton.styleFrom(primary: Colors.red),
          child: const Text('Already have an account? Login',
              style: TextStyle(fontSize: 20.0)),
        )
      ];
    }
  }
}
