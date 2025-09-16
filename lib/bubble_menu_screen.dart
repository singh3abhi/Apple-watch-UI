import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bubble_lenses_ui.dart';

class BubbleMenuScreen extends StatelessWidget {
  const BubbleMenuScreen({Key? key}) : super(key: key);
  final decoration1 = const ShapeDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      colors: [Color(0xFF791CF2), Color(0xFF791EEE), Color(0xFFAF5BFE)],
      stops: [0.0, 0.4375, 1.0],
    ),
    shape: OvalBorder(),
  );

  final decoration2 = const ShapeDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      colors: [Color(0xFF343BFF), Color(0xFF656AFF), Color(0xFF403098)],
      stops: [0.0, 0.75, 1.0],
    ),
    shape: OvalBorder(),
  );

  final decoration3 = const ShapeDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      colors: [Color(0xFF7CDEFF), Color(0xFF149BDA), Color(0xFF366CC3)],
      stops: [0.0, 0.75, 1.0],
    ),
    shape: OvalBorder(),
  );

  final decoration4 = const ShapeDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      colors: [Color(0xFF791CF2), Color(0xFF791EEE), Color(0xFF4B0091)],
      stops: [0.0, 0.4375, 1.0],
    ),
    shape: OvalBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Bubbles UI', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: BubbleLens(
          width: 400,
          height: 500,
          size: 85,
          paddingX: 15,
          paddingY: 10,
          duration: Duration(milliseconds: 150),
          highRatio: 0.5,
          lowRatio: 0.1,
          onBubbleTap: (index) {
            print('Tapped bubble $index');
          },
          widgets: [
            Container(
              decoration: decoration2,
              padding: EdgeInsets.all(22),
              child: SvgPicture.asset('assets/icons/shocked.svg'),
            ),
            Container(
              decoration: decoration3,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/sci-fi.svg'),
            ),
            Container(
              decoration: decoration1,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/drama.svg'),
            ),

            Container(
              decoration: decoration3,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/fantasy.svg'),
            ),
            Container(
              decoration: decoration4,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/sports.svg'),
            ),
            Container(
              decoration: decoration2,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/happy.svg'),
            ),
            Container(
              decoration: decoration3,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/horror.svg'),
            ),

            Container(
              decoration: decoration2,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/sci-fi.svg'),
            ),
            Container(
              decoration: decoration3,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/romance.svg'),
            ),
            Container(
              decoration: decoration1,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/action.svg'),
            ),

            Container(
              decoration: decoration2,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/horror.svg'),
            ),
            Container(
              decoration: decoration1,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/happy.svg'),
            ),
            Container(
              decoration: decoration3,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/sports.svg'),
            ),
            Container(
              decoration: decoration4,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/fantasy.svg'),
            ),

            Container(
              decoration: decoration3,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/drama.svg'),
            ),
            Container(
              decoration: decoration2,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/sci-fi.svg'),
            ),
            Container(
              decoration: decoration1,
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset('assets/icons/shocked.svg'),
            ),

            // // Small decorative bubbles
            // Container(decoration: ShapeDecoration(color: Color(0xFF1CB9FF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF1CB9FF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF8300FF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF8300FF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF8300FF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF8300FF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF1CB9FF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF1CB9FF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF637BFF), shape: OvalBorder())),
            // Container(decoration: ShapeDecoration(color: Color(0xFF637BFF), shape: OvalBorder())),
          ],
        ),
      ),
    );
  }
}
