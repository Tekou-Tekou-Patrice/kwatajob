import 'package:flutter/material.dart';
import 'package:kwatajob/Pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KwataJob',
      debugShowCheckedModeBanner: false,
     
      home: const Login(),
    );
  }
}



