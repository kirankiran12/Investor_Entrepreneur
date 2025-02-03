import 'package:flutter/material.dart';

class GradientOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final List<Color> gradientColors;

  const GradientOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.gradientColors = const [Colors.blue, Colors.purple, Colors.red, Colors.orange], // Default gradient
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors, // Gradient border colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(2), // Thickness of the border
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // White button background
          elevation: 0, // Remove shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: gradientColors, // Gradient text colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // This color is masked by ShaderMask
            ),
          ),
        ),
      ),
    );
  }
}
