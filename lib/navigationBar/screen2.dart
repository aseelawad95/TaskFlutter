import 'package:flutter/material.dart';
import 'package:task_flutter/navigationBar/screen1.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen2"),
      ),
      body:  Column(
        children: [
          IconButton(onPressed: () {
            // Navigator.
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Screen1()),
            );

          }, icon: const Icon(Icons.arrow_back)),
           const Text("Screen2"),
        ],
      ),
    );
  }
}