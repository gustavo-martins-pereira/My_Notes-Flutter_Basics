import 'package:flutter/material.dart';
import 'package:notes/constraints/routes.dart';
import 'package:notes/services/auth/auth_service.dart';
import 'package:notes/utils/exceptions/auth_exceptions.dart';
import 'package:notes/utils/show_error_dialog.dart';

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
                await AuthService.firebase().createUser(
                  email: email,
                  password: password,
                );

                await AuthService.firebase().sendEmailVerification();

                Navigator.of(context).pushNamed(verifyEmailRoute);
              } on EmailAlreadyInUseException {
                await showErrorDialog(
                  context,
                  "The email address is already in use.",
                );
              } on InvalidEmailException {
                await showErrorDialog(context, "This email is bad formated");
              } on GenericAuthException {
                await showErrorDialog(context, "Failed to register");
              }
            },
            child: Text("Register"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: Text("Already have you an account? Log in!"),
          ),
        ],
      ),
    );
  }
}
