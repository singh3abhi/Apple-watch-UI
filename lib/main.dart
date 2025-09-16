import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Bubble Lens', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
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
              child: Stack(
                children: [
                  //Row
                  Positioned(
                    left: 130.27,
                    top: 0,
                    child: Container(
                      width: 13.03,
                      height: 13.03,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF1CB9FF),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 221.46,
                    top: 0,
                    child: Container(
                      width: 13.03,
                      height: 13.03,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF1CB9FF),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),

                  // -------------
                  Positioned(
                    left: 26.06,
                    top: 71.65,
                    child: Container(
                      width: 13.03,
                      height: 13.03,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF8300FF),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 130.42,
                    top: 91.19,
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
                  Positioned(
                    left: 221.61,
                    top: 91.19,
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

                  Positioned(
                    left: 306.44,
                    top: 91.19,
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
                  Positioned(
                    left: 325.67,
                    top: 71.65,
                    child: Container(
                      width: 13.03,
                      height: 13.03,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF8300FF),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),

                  // -------------
                  // Row
                  Positioned(
                    left: 78.46,
                    top: 189.80,
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

                  Positioned(
                    left: 172.83,
                    top: 179.19,
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
                  Positioned(
                    left: 270.38,
                    top: 179.19,
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

                  Positioned(
                    left: 358.39,
                    top: 189.80,
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

                  // -------------
                  // Row
                  Positioned(
                    left: 0,
                    top: 237.74,
                    child: Container(
                      width: 13.03,
                      height: 13.03,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF8300FF),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 39.23,
                    top: 204.64,
                    child: Container(
                      width: 78.16,
                      height: 78.16,
                      decoration: decoration2,
                    ),
                  ),
                  Positioned(
                    left: 127.24,
                    top: 188.74,
                    child: Container(
                      width: 110.53,
                      height: 111.64,
                      decoration: decoration3,
                    ),
                  ),
                  Positioned(
                    left: 247.06,
                    top: 204.64,
                    child: Container(
                      width: 78.16,
                      height: 78.16,
                      decoration: decoration1,
                    ),
                  ),
                  Positioned(
                    left: 351.72,
                    top: 237.74,
                    child: Container(
                      width: 13.03,
                      height: 13.03,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF8300FF),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),

                  // ------------
                  Positioned(
                    left: 6.37,
                    top: 300.07,
                    child: Container(
                      width: 71.65,
                      height: 71.65,
                      decoration: decoration2,
                    ),
                  ),
                  Positioned(
                    left: 94.45,
                    top: 309.39,
                    child: Container(
                      width: 78.16,
                      height: 78.16,
                      decoration: decoration1,
                    ),
                  ),
                  Positioned(
                    left: 191.92,
                    top: 309.62,
                    child: Container(
                      width: 78.16,
                      height: 78.16,
                      decoration: decoration3,
                    ),
                  ),

                  Positioned(
                    left: 286.59,
                    top: 299.62,
                    child: Container(
                      width: 71.65,
                      height: 71.65,
                      decoration: decoration4,
                    ),
                  ),

                  // -------------

                  // Row
                  Positioned(
                    left: 39.08,
                    top: 410.34,
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

                  Positioned(
                    left: 143.15,
                    top: 397.62,
                    child: Container(
                      width: 78.16,
                      height: 78.16,
                      decoration: decoration2,
                    ),
                  ),
                  Positioned(
                    left: 234.33,
                    top: 397.62,
                    child: Container(
                      width: 71.65,
                      height: 71.65,
                      decoration: decoration1,
                    ),
                  ),
                  Positioned(
                    left: 58.32,
                    top: 397.62,
                    child: Container(
                      width: 71.65,
                      height: 71.65,
                      decoration: decoration3,
                    ),
                  ),

                  Positioned(
                    left: 338.70,
                    top: 410.34,
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

                  // -------------

                  // Row
                  Positioned(
                    left: 143.30,
                    top: 481.99,
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

                  Positioned(
                    left: 234.48,
                    top: 481.99,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
