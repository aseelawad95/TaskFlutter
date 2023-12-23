import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool _textVisible = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 15), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentDate = DateTime.now();
    print(currentDate.add(const Duration(days: 3,hours: 5,minutes: 20)));
    var lateDate = currentDate.add(Duration(seconds: 5));
    print("late : ${lateDate.isAfter(currentDate)}");
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/images/starter.png'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.2),
          ],),),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedTextKit(
                  pause: const Duration(milliseconds: 200),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Taking Order For Faster Delivery',
                       speed: const Duration(milliseconds: 200),
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedTextKit(
                  pause: const Duration(milliseconds: 200),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      "See restaurants nearby by \nadding location",
                       speed: const Duration(milliseconds: 200),
                      textStyle: const  TextStyle(color: Colors.white, height: 1.4, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                AnimatedOpacity(
                  opacity: _textVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 100),
                  child: const Align(
                    child: Text(
                      "Now Deliver To Your Door 24/7",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
