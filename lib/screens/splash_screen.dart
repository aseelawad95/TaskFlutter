import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  final bool _textVisible = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
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
          ])),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Taking Order For Faster Delivery',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "See restaurants nearby by \nadding location",
                  style:
                      TextStyle(color: Colors.white, height: 1.4, fontSize: 18),
                ),
                const SizedBox(
                  height: 100,
                ),
                // ScaleTransition(
                //   scale: _animation,
                //   child: Container(
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           gradient: const LinearGradient(
                //               colors: [Colors.yellow, Colors.orange])),
                //       child: AnimatedOpacity(
                //         opacity: _textVisible ? 1.0 : 0.0,
                //         duration: const Duration(milliseconds: 50),
                //         child: MaterialButton(
                //           onPressed: () => _onTap(),
                //           minWidth: double.infinity,
                //           child: const Text(
                //             "Start",
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       )),
                // ),
                const SizedBox(
                  height: 30,
                ),
                AnimatedOpacity(
                  opacity: _textVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 50),
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
