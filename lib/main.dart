import 'package:flutter/material.dart';
// import 'package:faker/faker.dart';
import 'package:my_app/pages/login_form.dart';
import 'package:my_app/pages/signup_form.dart';
import 'package:my_app/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: const LoginForm(),
      initialRoute: '/login',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => const Dashboard(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/signup': (context) => const SignupForm(),
        '/dashboard': (context) => const Dashboard(),
      },
    ));
  }
}
