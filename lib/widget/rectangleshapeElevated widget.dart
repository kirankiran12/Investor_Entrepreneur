
import 'package:flutter/material.dart';



class  RectangleElevated extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onPressed;

  const  RectangleElevated({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.backgroundColor = const Color.fromARGB(255, 215, 212, 212),
    this.elevation = 4.0,
this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = 8.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),padding: padding,
      ),
      child: Text(
      text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
