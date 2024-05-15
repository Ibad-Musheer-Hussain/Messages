import 'package:flutter/material.dart';
import 'package:message/Loggedin.dart';
import 'package:message/Login.dart';
import 'package:message/Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/home': (context) => const Login(),
        "/Loggedin": (context) => const Loggedin(),
        "/Signup": (context) => const SignUp(),
      },
      home: const Login(),
    );
  }
}
