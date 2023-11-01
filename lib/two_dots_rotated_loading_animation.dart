import 'package:flutter/material.dart';

class TwoDotsRotatedLoadingAnimationDesign extends StatefulWidget {
  const TwoDotsRotatedLoadingAnimationDesign({super.key});

  @override
  State<TwoDotsRotatedLoadingAnimationDesign> createState() =>
      _TwoDotsRotatedLoadingAnimationDesignState();
}

class _TwoDotsRotatedLoadingAnimationDesignState
    extends State<TwoDotsRotatedLoadingAnimationDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _animationController.forward();
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Two Dots Rotated Loading Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _rotationAnimation,
              child: Container(
                width: 55,
                height: 25,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.purple, shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
