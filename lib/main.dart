import 'package:flutter/material.dart';
import 'package:task_flutter/screens/animation_screen.dart';
import 'package:task_flutter/screens/home_screen.dart';
import 'package:task_flutter/screens/main_screen.dart';
import 'package:task_flutter/screens/run_container.dart';
import 'package:task_flutter/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task Flutter',
      debugShowCheckedModeBanner: false,
      home: AnimationScreen(),
    );
  }
}


