import 'package:flutter/material.dart';
import 'dart:math' as math;

class PizzaBox extends StatelessWidget {
  const PizzaBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxHeight = constraints.maxHeight / 2.0;
        final boxWidth = constraints.maxWidth / 2.0;
        final minAngle = -45.0;

        return Stack(
          children: [
            Center(
              child: Transform(
                alignment: Alignment.topCenter,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(minAngle * math.pi / 180),
                child: Image.asset(
                  'assets/images/box_inside.png',
                  height: boxHeight,
                  width: boxWidth,
                ),
              ),
            ),
            Center(
              child: Transform(
                alignment: Alignment.topCenter,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.003)
                  ..rotateX(-120 * math.pi / 180),
                child: Image.asset(
                  'assets/images/box_inside.png',
                  height: boxHeight,
                  width: boxWidth,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
