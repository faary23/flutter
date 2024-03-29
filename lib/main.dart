import 'package:batik_srikandi/screens/welcome.dart';
import 'package:batik_srikandi/screens/home_page.dart';
import 'screens/login.dart';
import 'package:flutter/material.dart';
import 'package:batik_srikandi/screens/login.dart';
import 'package:batik_srikandi/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter ChatApp',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: WelcomePage());
  }
}
