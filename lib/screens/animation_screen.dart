import 'package:flutter/material.dart';
import 'dart:math' as math show sin, pi, sqrt;


class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> with  TickerProviderStateMixin{
  late AnimationController _controller;
  //late AnimationController _controllerForIcon;
 // bool _isScaled = false;
 //  late AnimationController _animationController;
 //  late Animation<double> _animation;
 //  double size = 20;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(microseconds: 100),
    )..forward();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..forward();

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 1, end: 1.5).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    // _controllerForIcon =
    //     AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    // _animationController =
    // AnimationController(vsync: this, duration: const Duration(milliseconds: 800))
    //   ..repeat(reverse: true);
    // _animation =
    //     Tween<double>(begin: 1.0, end: 1.3).animate(_animationController);
   //  isFavorite ?  _controller.addStatusListener((status) {
   //    if (status == AnimationStatus.completed) {
   //      // Stop the animation when it reaches the end
   //      _controller.stop();
   //    }
   //  }): const Icon(Icons.favorite_outline);
   //  isFavorite ?  _animationController.addStatusListener((status) {
   //    if (status == AnimationStatus.completed) {
   //      // Stop the animation when it reaches the end
   //      _controller.stop();
   //    }
   //  }): const Icon(Icons.favorite_outline);
   // isFavorite ?  _scaleAnimation.addStatusListener((status) {
   //    if (status == AnimationStatus.completed) {
   //       _controller.stop();
   //    }
   //  }):const Icon(Icons.favorite_outline);
  }
  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();

    // _controllerForIcon.dispose();
    //_animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return AnimatedBuilder(
      animation: CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      builder: (context, child) {
        return
          //isFavorite ?
        InkWell(
          onTap: () {
            setState(() {
              isFavorite = true;
              _animationController.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  _controller.stop();
                }
              });
              _scaleAnimation.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  _controller.stop();
                }
              });
              _controller.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  // Stop the animation when it reaches the end
                  _controller.stop();
                }
              });
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildContainer(50 * _controller.value),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child:isFavorite ?    Icon(
                      Icons.favorite,
                      color:isFavorite ?  Colors.red : Colors.grey,
                      size: 20,
                    ): IconButton(onPressed: () {
                             setState(() {
                               isFavorite = true;
                             });
                    }, icon:  Icon(Icons.favorite_outline,size: 20,color:isFavorite ?  Colors.red : Colors.grey)),
                  )
              ),
              // Container(
              //     alignment: Alignment.topCenter,
              //     padding: const EdgeInsets.all(8.0),
              //     child: AnimatedBuilder(
              //       animation: _animation,
              //       builder: (BuildContext context, Widget? child) {
              //         return Container(
              //           alignment: Alignment.center,
              //           child: Icon(
              //             Icons.favorite,
              //             color: Colors.red,
              //             size: size * _animation.value,
              //           ),
              //         );
              //       },
              //     )
              // ),
              // Container(
              //   alignment: Alignment.center,
              //   padding: const EdgeInsets.all(8.0),
              //   child: GestureDetector(
              //     onTap: () {
              //       _isScaled = !_isScaled;
              //       _isScaled
              //           ? _controllerForIcon.forward()
              //           : _controllerForIcon.stop();
              //     },
              //     child: ScaleTransition(
              //       scale: Tween(begin: 1.0, end: 1.5).animate(_controllerForIcon),
              //       child: const Icon(Icons.favorite, size: 30,),
              //     ),
              //   ),
              // ),
             //const  Align(child: Icon(Icons.favorite, size: 30,)),
            ],
          ),
        );
            // :
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       isFavorite = false;
            //
            //     });
            //   },
            //   child:             const Icon(Icons.favorite_outline,color: Colors.grey,size: 30,),
            // )
        //;
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
               color: Colors.blue.withOpacity(1 - _controller.value),
      ),
    );
  }
}








class Ripples extends StatefulWidget {
  const Ripples({
    required Key key,
    this.size = 80.0,
    this.color = Colors.pink,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  @override
  _RipplesState createState() => _RipplesState();
}

class _CirclePainter extends CustomPainter {
  _CirclePainter(
      this._animation, {
        required this.color,
      }) : super(repaint: _animation);

  final Color color;
  final Animation<double> _animation;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color _color = color.withOpacity(opacity);

    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);

    final Paint paint = Paint()..color = _color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) => true;
}

class _RipplesState extends State<Ripples> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                widget.color,
               // Color.lerp(widget.color, Colors.black, .05)
              ],
            ),
          ),
          child: ScaleTransition(
            scale: Tween(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(
                parent: _controller,
                curve: const _PulsateCurve(),
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CirclePainter(
        _controller,
        color: widget.color,
      ),
      child: SizedBox(
        width: widget.size * 2.125,
        height: widget.size * 2.125,
        child: _button(),
      ),
    );
  }
}

class _PulsateCurve extends Curve {
  const _PulsateCurve();

  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }}