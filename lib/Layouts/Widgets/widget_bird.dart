import 'package:flappy_bird/Global/constant.dart';
import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final double yAxis;
  final double birdWidth;
  final double birdHeight;

  const Bird(this.yAxis, this.birdWidth, this.birdHeight, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      alignment: Alignment(0, (2 * yAxis + birdHeight) / (2 - birdHeight)),
      duration: const Duration(milliseconds: 0),
      child: Image.asset(
        Str.bird,
        width: size.width * birdWidth,
        height: size.height * birdHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
