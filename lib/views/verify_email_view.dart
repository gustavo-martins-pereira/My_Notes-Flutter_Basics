import 'package:flutter/material.dart';
import 'package:notes/constraints/routes.dart';
import 'package:notes/services/auth/auth_service.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify email")),
      body: Column(
        children: [
          Text(
            "We've sent an verification to your email. Please check out to create your account",
          ),
          Text("If you haven't receive, please click on the button below"),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: Text("Send email verification"),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();

              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: Text("Restart"),
          ),
        ],
      ),
    );
  }
}
