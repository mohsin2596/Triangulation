import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'constans/strings.dart';

void main() => runApp(Triangulation());

class Triangulation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
