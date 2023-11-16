import 'package:flappy_bird/Global/constant.dart';
import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final double yAxis;

  const Bird({
    required this.yAxis,
    super.key,
  });

  static const double birdSize = 0.183;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      alignment: Alignment(
        0,
        (2 * yAxis + birdSize) / (2 - birdSize),
      ),
      duration: const Duration(milliseconds: 0),
      child: Image.asset(
        Str.bird,
        width: size.width * birdSize,
        height: size.height * birdSize,
        fit: BoxFit.cover,
      ),
    );
  }
}
