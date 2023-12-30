import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/navigationBar/bar.dart';
import 'package:task_flutter/navigationBar/nav.dart';
import 'package:task_flutter/navigationBar/screen1.dart';
import 'package:task_flutter/navigationBar/screen2.dart';
import 'package:task_flutter/screens/animation_screen.dart';
import 'package:task_flutter/screens/home_screen.dart';
import 'package:task_flutter/screens/main_screen.dart';
import 'package:task_flutter/screens/run_container.dart';
import 'package:task_flutter/screens/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NavbarProvider>(create: (_) => NavbarProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/home': (context) => const Screen1(),
        '/details': (context) => const Screen2(),
      },
      title: 'Task Flutter',
      debugShowCheckedModeBanner: false,
      home: NavbarScreen(),
    );
  }
}







class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconButton(
              onPressed: () {
                setState(() {
                  selected = !selected;
                });
              },
              icon:
              selected ? const Icon(Icons.add) : const Icon(Icons.check))),
    );
  }
}
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   bool selected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: IconButton(
//               onPressed: () {
//                 setState(() {
//                   selected = !selected;
//                 });
//               },
//               icon:
//               selected ? const Icon(Icons.add) : const Icon(Icons.check))),
//     );
//   }
// }
