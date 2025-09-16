import 'dart:math';

import 'package:flutter/material.dart';
import 'bubble_menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubble Lens',
      home: BubbleMenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double _offsetX = 0.0;
  double _offsetY = 0.0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double _getScaleForPosition(
    double left,
    double top,
    double width,
    double height,
  ) {
    const double containerCenterX = 364.75 / 2;
    const double containerCenterY = 481.99 / 2;

    double bubbleCenterX = left + width / 2 + _offsetX;
    double bubbleCenterY = top + height / 2 + _offsetY;

    double distance = sqrt(
      pow(containerCenterX - bubbleCenterX, 2) +
          pow(containerCenterY - bubbleCenterY, 2),
    );

    double maxDistance = sqrt(
      pow(containerCenterX, 2) + pow(containerCenterY, 2),
    );
    double normalizedDistance = distance / maxDistance;

    return 1.0 + (1.0 - normalizedDistance) * 0.5;
  }

  Widget _buildAnimatedBubble({
    required double left,
    required double top,
    required double width,
    required double height,
    required ShapeDecoration decoration,
    Matrix4? transform,
  }) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      left: left + _offsetX,
      top: top + _offsetY,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        transform:
            Matrix4.identity()
              ..scale(_getScaleForPosition(left, top, width, height)),
        child: Container(
          transform: transform,
          width: width,
          height: height,
          decoration: decoration,
        ),
      ),
    );
  }

  final decoration1 = const ShapeDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0), // 50% 50% → center
      radius: 0.5, // 50% of size
      colors: [
        Color(0xFF791CF2), // 0%
        Color(0xFF791EEE), // 43.75%
        Color(0xFFAF5BFE), // 100%
      ],
      stops: [0.0, 0.4375, 1.0],
    ),
    shape: OvalBorder(),
  );

  final decoration2 = const ShapeDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0), // 50% 50% -> center
      radius: 0.5, // 50% of container
      colors: [
        Color(0xFF343BFF), // 0%
        Color(0xFF656AFF), // 75%
        Color(0xFF403098), // 100%
      ],
      stops: [0.0, 0.75, 1.0],
    ),
    shape: OvalBorder(),
  );

  final decoration3 = const ShapeDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0), // 50% 50% = center
      radius: 0.5, // 50% spread
      colors: [
        Color(0xFF7CDEFF), // 0%
        Color(0xFF149BDA), // 75%
        Color(0xFF366CC3), // 100%
      ],
      stops: [0.0, 0.75, 1.0],
    ),
    shape: OvalBorder(),
  );

  final decoration4 = const ShapeDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0), // 50% 50% = center
      radius: 0.5, // 50% spread
      colors: [
        Color(0xFF791CF2), // 0%
        Color(0xFF791EEE), // 43.75%
        Color(0xFF4B0091), // 100%
      ],
      stops: [
        0.0,
        0.4375, // 43.75%
        1.0,
      ],
    ),
    shape: OvalBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 364.75,
              height: 481.99,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _offsetX += details.delta.dx;
                    _offsetY += details.delta.dy;
                  });
                },
                child: Stack(
                  children: [
                    //Row
                    Positioned(
                      left: 130.27 + _offsetX,
                      top: 0 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(130.27, 0, 13.03, 13.03),
                        child: Container(
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1CB9FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 221.46 + _offsetX,
                      top: 0 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(221.46, 0, 13.03, 13.03),
                        child: Container(
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1CB9FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),

                    // -------------
                    Positioned(
                      left: 26.06 + _offsetX,
                      top: 71.65 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(26.06, 71.65, 13.03, 13.03),
                        child: Container(
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF8300FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 130.42 + _offsetX,
                      top: 91.19 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          130.42,
                          91.19,
                          71.65,
                          71.65,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 71.65,
                          height: 71.65,
                          decoration: decoration2,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 221.61 + _offsetX,
                      top: 91.19 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          221.61,
                          91.19,
                          78.16,
                          78.16,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 78.16,
                          height: 78.16,
                          decoration: decoration3,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 306.44 + _offsetX,
                      top: 91.19 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          306.44,
                          91.19,
                          71.65,
                          71.65,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 71.65,
                          height: 71.65,
                          decoration: decoration1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 325.67 + _offsetX,
                      top: 71.65 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          325.67,
                          71.65,
                          13.03,
                          13.03,
                        ),
                        child: Container(
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF8300FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),

                    // -------------
                    // Row
                    Positioned(
                      left: 78.46 + _offsetX,
                      top: 189.80 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          78.46,
                          189.80,
                          71.65,
                          71.65,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 71.65,
                          height: 71.65,
                          decoration: decoration3,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 172.83 + _offsetX,
                      top: 179.19 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          172.83,
                          179.19,
                          78.16,
                          78.16,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 78.16,
                          height: 78.16,
                          decoration: decoration4,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 270.38 + _offsetX,
                      top: 179.19 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          270.38,
                          179.19,
                          78.16,
                          78.16,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 78.16,
                          height: 78.16,
                          decoration: decoration2,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 358.39 + _offsetX,
                      top: 189.80 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          358.39,
                          189.80,
                          71.65,
                          71.65,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 71.65,
                          height: 71.65,
                          decoration: decoration3,
                        ),
                      ),
                    ),

                    // -------------
                    // Row
                    Positioned(
                      left: 0 + _offsetX,
                      top: 237.74 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(0, 237.74, 13.03, 13.03),
                        child: Container(
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF8300FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 39.23 + _offsetX,
                      top: 204.64 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          39.23,
                          204.64,
                          78.16,
                          78.16,
                        ),
                        child: Container(
                          width: 78.16,
                          height: 78.16,
                          decoration: decoration2,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 127.24 + _offsetX,
                      top: 188.74 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          127.24,
                          188.74,
                          110.53,
                          111.64,
                        ),
                        child: Container(
                          width: 110.53,
                          height: 111.64,
                          decoration: decoration3,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 247.06 + _offsetX,
                      top: 204.64 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          247.06,
                          204.64,
                          78.16,
                          78.16,
                        ),
                        child: Container(
                          width: 78.16,
                          height: 78.16,
                          decoration: decoration1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 351.72 + _offsetX,
                      top: 237.74 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          351.72,
                          237.74,
                          13.03,
                          13.03,
                        ),
                        child: Container(
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF8300FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),

                    // ------------
                    Positioned(
                      left: 6.37 + _offsetX,
                      top: 300.07 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(6.37, 300.07, 71.65, 71.65),
                        child: Container(
                          width: 71.65,
                          height: 71.65,
                          decoration: decoration2,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 94.45 + _offsetX,
                      top: 309.39 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          94.45,
                          309.39,
                          78.16,
                          78.16,
                        ),
                        child: Container(
                          width: 78.16,
                          height: 78.16,
                          decoration: decoration1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 191.92 + _offsetX,
                      top: 309.62 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          191.92,
                          309.62,
                          78.16,
                          78.16,
                        ),
                        child: Container(
                          width: 78.16,
                          height: 78.16,
                          decoration: decoration3,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 286.59 + _offsetX,
                      top: 299.62 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          286.59,
                          299.62,
                          71.65,
                          71.65,
                        ),
                        child: Container(
                          width: 71.65,
                          height: 71.65,
                          decoration: decoration4,
                        ),
                      ),
                    ),

                    // -------------

                    // Row
                    Positioned(
                      left: 39.08 + _offsetX,
                      top: 410.34 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          39.08,
                          410.34,
                          13.03,
                          13.03,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1CB9FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 143.15 + _offsetX,
                      top: 397.62 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          143.15,
                          397.62,
                          78.16,
                          78.16,
                        ),
                        child: Container(
                          width: 78.16,
                          height: 78.16,
                          decoration: decoration2,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 234.33 + _offsetX,
                      top: 397.62 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          234.33,
                          397.62,
                          71.65,
                          71.65,
                        ),
                        child: Container(
                          width: 71.65,
                          height: 71.65,
                          decoration: decoration1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 58.32 + _offsetX,
                      top: 397.62 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          58.32,
                          397.62,
                          71.65,
                          71.65,
                        ),
                        child: Container(
                          width: 71.65,
                          height: 71.65,
                          decoration: decoration3,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 338.70 + _offsetX,
                      top: 410.34 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          338.70,
                          410.34,
                          13.03,
                          13.03,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1CB9FF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),

                    // -------------

                    // Row
                    Positioned(
                      left: 143.30 + _offsetX,
                      top: 481.99 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          143.30,
                          481.99,
                          13.03,
                          13.03,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF637BFF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 234.48 + _offsetX,
                      top: 481.99 + _offsetY,
                      child: Transform.scale(
                        scale: _getScaleForPosition(
                          234.48,
                          481.99,
                          13.03,
                          13.03,
                        ),
                        child: Container(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-3.14),
                          width: 13.03,
                          height: 13.03,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF637BFF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
