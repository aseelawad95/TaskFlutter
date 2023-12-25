import 'package:flutter/material.dart';
import 'package:task_flutter/navigationBar/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Screen1"),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/details');
              },
              icon: const Icon(Icons.arrow_back)),
          const Center(child: Text("Screen1")),
        ],
      ),
    );
  }
}
