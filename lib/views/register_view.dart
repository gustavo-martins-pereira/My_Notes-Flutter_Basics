import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "Enter your email here"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(hintText: "Enter your password here"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              try {
                final userCredential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                print(userCredential);
              } on FirebaseAuthException catch (error) {
                print(error.code);
                if (error.code == "invalid-email") {
                  print(error.message);
                }
                if (error.code == "email-already-in-use") {
                  print(error.message);
                }
                if (error.code == "weak-password") {
                  print(error.message);
                }
              }
            },
            child: Text("Register"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil("/login/", (route) => false);
            },
            child: Text("Already have you an account? Log in!"),
          ),
        ],
      ),
    );
  }
}
