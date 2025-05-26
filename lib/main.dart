import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "Enter your email here"
              ),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                hintText: "Enter your password here"
              ),
            ),
            TextButton(
              onPressed: () async {},
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
