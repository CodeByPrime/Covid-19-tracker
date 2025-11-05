import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late AnimationController _animationController=AnimationController(vsync: this,duration: Duration(seconds: 4))..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
           AnimatedBuilder(
            animation: _animationController,
            builder: (context, child)  {
              return Transform.rotate(angle: _animationController.value *2.0 * math.pi,child: ,)
            },
           )
          ],
        ),
      ),
    );
  }
}
