
import 'package:flutter/material.dart';

class GradientOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final List<Color> gradientColors;

  const GradientOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.gradientColors = const [Colors.blue, Colors.purple, Colors.red, Colors.orange], 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors, 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, 
          elevation: 0, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            
            if (icon != null)
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: gradientColors, 
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white, 
                ),
              ),
            if (icon != null) const SizedBox(width: 8), 
            
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: gradientColors, 
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
