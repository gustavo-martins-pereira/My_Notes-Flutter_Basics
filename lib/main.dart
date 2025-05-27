import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/views/login_view.dart';
import 'package:notes/views/register_view.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
      routes: {
        "/login/": (context) => LoginView(),
        "/register/": (context) => RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
          // final user = FirebaseAuth.instance.currentUser;
          // print(user);
          // if (user?.emailVerified ?? false) {
          //   print("Email verified");
          // } else {
          //   return VerifyEmailView();
          // }

            return LoginView();
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify email"),
      ),
      body: Column(
        children: [
          Text("Please verify your email address"),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              print(user);
              await user?.sendEmailVerification();
            },
            child: Text("Send email verification"),
          ),
        ],
      ),
    );
  }
}
