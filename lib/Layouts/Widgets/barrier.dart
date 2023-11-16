import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double barrierHeight;
  final double barrierWidth;
  final bool isTop;
  final double direction;

  const Barrier({
    super.key,
    required this.barrierHeight,
    required this.barrierWidth,
    required this.direction,
    required this.isTop,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
      alignment: Alignment(
        (2 * direction + barrierWidth) / (2 - barrierWidth),
        isTop ? 1.1 : -1.1,
      ),
      duration: const Duration(milliseconds: 0),
      child: Container(
        height: (size.height) / (4 * barrierHeight) / 2,
        width: size.width * barrierWidth / 2,
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            width: 10,
            color: Colors.green.shade900,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
