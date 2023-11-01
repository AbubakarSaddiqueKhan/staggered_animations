import 'package:flutter/material.dart';

class NavigationDrawerDesign extends StatefulWidget {
  const NavigationDrawerDesign({super.key});

  @override
  State<NavigationDrawerDesign> createState() => _NavigationDrawerDesignState();
}

late AnimationController _animationController;
late Animation<double> _rotateAnimation;
late Animation<double> _opacityAnimation;
late Animation<Alignment> _dropAnimation;
late Animation<double> _widthAnimation;
late Animation<double> _heightAnimation;
late Animation<double> _containerOpacityAnimation;
late Animation<double> _containerChildScaleAnimation;
late Animation<BorderRadiusGeometry> _containerShapeAnimation;
late Animation<Offset> _leftSlideAnimation;
late Animation<double> _containerChildOpacityAnimation;

class _NavigationDrawerDesignState extends State<NavigationDrawerDesign>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addListener(() {
            setState(() {});
          });
    _rotateAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Interval(0, 0.2)));
    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.1, 0.2)));
    _dropAnimation =
        Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.bottomLeft)
            .animate(CurvedAnimation(
                parent: _animationController, curve: Interval(0.2, 0.4)));
    _widthAnimation = Tween<double>(begin: 0.01, end: 0.2).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.65, 0.75)));
    _heightAnimation = Tween<double>(begin: 0.025, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.45, 0.6)));

    _containerOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.2, 0.5)));

              _containerShapeAnimation = Tween<BorderRadiusGeometry>(
            begin: BorderRadius.only(
                topRight: Radius.circular(300),
                bottomRight: Radius.circular(300)),
            end: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Interval(0, 0.45)));


    _containerChildScaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.75, 0.85)));



    _leftSlideAnimation =
        Tween<Offset>(begin: Offset(-3, -3), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _animationController, curve: Interval(0.8, 0.9)));

    _containerChildOpacityAnimation = Tween<double>(
            begin: 0 , end:  1)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Interval(0.9, 1.0)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void rotateIcon() async {
    await _animationController.forward();
    _animationController.reverse();
  }

  void reverseAnimation() {
    print("reverse");
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer Design"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          Align(
            alignment: _dropAnimation.value,
            child: Opacity(
              opacity: _containerOpacityAnimation.value,
              child: Container(
                  width: screenWidth * _widthAnimation.value,
                  height: clientHeight * _heightAnimation.value,
                  decoration: BoxDecoration(
                      color: Colors.purple.shade300,
                      borderRadius: _containerShapeAnimation.value),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.2,
                          height: clientHeight * 0.43,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Opacity(
                                  opacity: _containerChildOpacityAnimation.value,
                                  child: Container(
                                    width: screenWidth * 0.2,
                                    height: clientHeight * 0.327,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 2,
                                              offset: Offset(-1, -1),
                                              spreadRadius: 2),
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 1,
                                              offset: Offset(1, 1),
                                              spreadRadius: 1)
                                        ],
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/p4.jpg",
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ScaleTransition(
                                  scale: _containerChildScaleAnimation,
                                  child: Opacity(
                                    opacity:
                                        _containerChildOpacityAnimation.value,
                                    child: Container(
                                      width: screenWidth * 0.2,
                                      height: clientHeight * 0.2,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white,
                                                blurRadius: 2,
                                                offset: Offset(-1, -1),
                                                spreadRadius: 2),
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 1,
                                                offset: Offset(1, 1),
                                                spreadRadius: 1)
                                          ],
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/p3.jpg",
                                            ),
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Opacity(
                                  opacity: _containerChildOpacityAnimation.value,
                                  child: IconButton(
                                      onPressed: reverseAnimation,
                                      icon: Icon(
                                        Icons.close_outlined,
                                        color: Colors.brown,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: clientHeight * 0.02,
                        ),
                        SlideTransition(
                          position: _leftSlideAnimation,
                          child: Text(
                            "Abubakar Saddique",
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 0.2,
                                    offset: Offset(-0.1, -0.1),
                                    spreadRadius: 0.2),
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 0.1,
                                    offset: Offset(0.1, 0.1),
                                    spreadRadius: 0.1)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: clientHeight * 0.02,
                        ),
                        ScaleTransition(
                          scale: _containerChildScaleAnimation,
                          child: Opacity(
                            opacity: _containerChildOpacityAnimation.value,
                            child: Text(
                              "Hello Medium Lover's  \n I Hope You all are Fine",
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 0.2,
                                      offset: Offset(-0.1, -0.1),
                                      spreadRadius: 0.2),
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 0.1,
                                      offset: Offset(0.1, 0.1),
                                      spreadRadius: 0.1)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: rotateIcon,
              child: RotationTransition(
                turns: _rotateAnimation,
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Icon(
                    Icons.menu_open,
                    color: Colors.brown,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
