import 'package:flutter/material.dart';
import 'package:untitled2/screen/check_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CheckScreen(),
    );
  }
}
