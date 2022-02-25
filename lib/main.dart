import 'package:flutter/material.dart';
import 'package:simple_login_app/screens/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple login',
      home: LoginScreen(),
    );
  }
}
