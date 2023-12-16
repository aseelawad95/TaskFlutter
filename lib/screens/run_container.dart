import 'package:flutter/material.dart';

import 'custom_screen.dart';


class RunContainer extends StatelessWidget {
  const RunContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper:CustomScreen() ,
            child: Container(
                 padding: EdgeInsets.all(0),
              color: Colors.red,
              child: SizedBox(
                height: 400,
                child: Text("hhh"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
