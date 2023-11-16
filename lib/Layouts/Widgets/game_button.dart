import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final Color color;

  const GameButton({
    super.key,
    required this.onPress,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
