import 'package:flutter/material.dart';

class ThreeDotWavyLoadingAnimationDesign extends StatefulWidget {
  const ThreeDotWavyLoadingAnimationDesign({super.key});

  @override
  State<ThreeDotWavyLoadingAnimationDesign> createState() =>
      _ThreeDotWavyLoadingAnimationDesignState();
}

late AnimationController _firstAnimationController;
late AnimationController _secondAnimationController;
late AnimationController _thirdAnimationController;

late Animation<Alignment> _firstUpAnimation;
late Animation<Alignment> _secondUpAnimation;
late Animation<Alignment> _thirdUpAnimation;

late Animation<Alignment> _firstDownAnimation;
late Animation<Alignment> _secondDownAnimation;
late Animation<Alignment> _thirdDownAnimation;

Alignment startAlignment = Alignment.center;
Alignment stopAlignment = Alignment.topCenter;

// late Animation<Alignment> _dropAnimation;
// late Animation<double> _widthAnimation;
// late Animation<double> _heightAnimation;
// late Animation<double> _containerOpacityAnimation;
// late Animation<double> _imageScaleAndOpacityAnimation;
// late Animation<BorderRadiusGeometry> _containerShapeAnimation;
// late Animation<Offset> _leftSlideAnimation;
// late Animation<Alignment> _rightSlideAnimation;

class _ThreeDotWavyLoadingAnimationDesignState
    extends State<ThreeDotWavyLoadingAnimationDesign>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _firstAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });

    _secondAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });

    _thirdAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });
    _firstUpAnimation =
        Tween<Alignment>(begin: startAlignment, end: stopAlignment).animate(
            CurvedAnimation(
                parent: _firstAnimationController, curve: Interval(0.0, 0.3)));

    _firstDownAnimation =
        Tween<Alignment>(begin: Alignment.center, end: Alignment.topCenter)
            .animate(CurvedAnimation(
                parent: _firstAnimationController, curve: Interval(0.3, 0.7)));

    _secondUpAnimation =
        Tween<Alignment>(begin: startAlignment, end: stopAlignment).animate(
            CurvedAnimation(
                parent: _secondAnimationController, curve: Interval(0.0, 0.3)));

    _secondDownAnimation =
        Tween<Alignment>(begin: Alignment.center, end: Alignment.topCenter)
            .animate(CurvedAnimation(
                parent: _secondAnimationController, curve: Interval(0.3, 0.7)));

    _thirdUpAnimation =
        Tween<Alignment>(begin: startAlignment, end: stopAlignment).animate(
            CurvedAnimation(
                parent: _thirdAnimationController, curve: Interval(0.0, 0.3)));

    _thirdDownAnimation =
        Tween<Alignment>(begin: Alignment.center, end: Alignment.topCenter)
            .animate(CurvedAnimation(
                parent: _thirdAnimationController, curve: Interval(0.3, 0.7)));

    // _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
    //     parent: _animationController, curve: Interval(0.1, 0.2)));
    // _dropAnimation =
    //     Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.bottomLeft)
    //         .animate(CurvedAnimation(
    //             parent: _animationController, curve: Interval(0.2, 0.4)));
    // _widthAnimation = Tween<double>(begin: 0.01, end: 0.2).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: Interval(0.65, 0.75)));
    // _heightAnimation = Tween<double>(begin: 0.03, end: 1.0).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: Interval(0.45, 0.6)));

    // _containerOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: Interval(0.2, 0.5)));
    // _imageScaleAndOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
    //     CurvedAnimation(
    //         parent: _animationController, curve: Interval(0.75, 0.85)));

    // _containerShapeAnimation = Tween<BorderRadiusGeometry>(
    //         begin: BorderRadius.only(
    //             topRight: Radius.circular(300),
    //             bottomRight: Radius.circular(300)),
    //         end: BorderRadius.only(
    //             topRight: Radius.circular(30),
    //             bottomRight: Radius.circular(30)))
    //     .animate(CurvedAnimation(
    //         parent: _animationController, curve: Interval(0, 0.45)));

    // _leftSlideAnimation =
    //     Tween<Offset>(begin: Offset(-3, -3), end: Offset(0, 0)).animate(
    //         CurvedAnimation(
    //             parent: _animationController, curve: Interval(0.8, 0.9)));

    // _rightSlideAnimation = Tween<Alignment>(
    //         begin: Alignment.bottomCenter, end: Alignment.topCenter)
    //     .animate(CurvedAnimation(
    //         parent: _animationController, curve: Interval(0.9, 1.0)));
  }

  @override
  void dispose() {
    _firstAnimationController.dispose();
    _secondAnimationController.dispose();
    _thirdAnimationController.dispose();
    super.dispose();
  }

  void startAnimation() async {
    for (var i = 0; i < 20; i++) {
      await _firstAnimationController.forward();

      _firstAnimationController.reverse();
      await _secondAnimationController.forward();
      _secondAnimationController.reverse();

      await _thirdAnimationController.forward();
      _thirdAnimationController.reverse();
    }
  }

  void reverseAnimation() {
    print("reverse");
    _firstAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Animation Design"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          width: 500,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: _firstUpAnimation.value,
                child: Align(
                  alignment: _firstDownAnimation.value,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Align(
                alignment: _secondUpAnimation.value,
                child: Align(
                  alignment: _secondDownAnimation.value,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Align(
                alignment: _thirdUpAnimation.value,
                child: Align(
                  alignment: _thirdDownAnimation.value,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: startAnimation),
    );
  }
}
