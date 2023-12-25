import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/navigationBar/nav.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    var bar = Provider.of<NavbarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(
              () {
                bar.selectedIndex;
              },
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Screen1"),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/details');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const Center(
            child: Text("Screen1"),
          ),
        ],
      ),
    );
  }
}
