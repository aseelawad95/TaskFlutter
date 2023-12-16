import 'package:flutter/material.dart';
import 'package:task_flutter/screens/custom_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomScreen(),
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400,
                      padding: const EdgeInsets.all(0),
                    )
                  ],
                )

              ),
            ),
          ],
        ),
      ),
    );
  }
}
