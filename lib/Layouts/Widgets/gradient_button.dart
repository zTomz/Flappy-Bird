import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Icon? icon;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final ButtonType buttonType;

  const GradientButton({
    this.icon,
    this.onTap,
    required this.width,
    required this.height,
    required this.buttonType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.grey.shade500,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: buttonType == ButtonType.text
            ? const Text(
                "Play",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 35,
                ),
              )
            : icon,
      ),
    );
  }
}

enum ButtonType {
  text,
  icon,
}
