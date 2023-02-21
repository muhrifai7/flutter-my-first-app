import 'package:flutter/material.dart';
// import 'package:faker/faker.dart';
import 'package:my_app/pages/login_form.dart';
import 'package:my_app/pages/signup_form.dart';
import 'package:my_app/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

// MaterialApp(
//       title: 'My',
//       // Start the app with the "/" named route. In this case, the app starts
//       // on the FirstScreen widget.
//       initialRoute: '/',
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => const FirstScreen(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/second': (context) => const SecondScreen(),
//       },
//     ),
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: const MyTest(),
      initialRoute: '/login',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => const LoginForm(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/signup': (context) => const SignupForm(),
        '/dashboard': (context) => Dashboard(),
      },
    ));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Apps"),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}
