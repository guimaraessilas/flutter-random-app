import 'package:flutter/material.dart';
import 'package:sandbox/screens/home.dart';
import 'package:sandbox/screens/login.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: LoginScreen(title: 'Login'),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: HomeScreen(title: 'Home'),
    );
  }
}
