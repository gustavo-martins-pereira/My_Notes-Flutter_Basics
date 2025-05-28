import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/views/login_view.dart';
import 'package:notes/views/register_view.dart';
import 'package:notes/views/verify_email_view.dart';

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
            final user = FirebaseAuth.instance.currentUser;

            if(user != null) {
              if(user.emailVerified) {
                print("Email verified");
              } else {
                return VerifyEmailView();
              }
            } else {
              return LoginView();
            }

            return Text("Done");
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}
