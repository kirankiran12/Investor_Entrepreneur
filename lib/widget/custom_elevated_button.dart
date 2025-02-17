
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? textSize;
  final double? borderRadius;
  final double? elevation;
  final Color? textColor;
  final FontWeight? fontWeight;
  final List<Color>? gradientColors;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool isIconRight;
  final bool isLoading;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.elevation,
    this.textColor,
    this.fontWeight,
    this.textSize,
    this.borderRadius,
    this.gradientColors,
    this.padding,
    this.width,
    this.height,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isIconRight = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(45),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 50), 
        ),
        elevation: elevation ?? 2,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors ?? [
              Colors.blue, Colors.purple, Colors.red, Colors.orange, 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 50), 
        ),
        child: Container(
          width: width,
          height: height ?? 50,
          alignment: Alignment.center,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
          child: isIconRight ? _buildTextWithIcon(context) : _buildIconWithText(context),
        ),
      ),
    );
  }

  Widget _buildIconWithText(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: iconSize ?? 22,
            color: iconColor ?? Colors.white,
          ),
          const SizedBox(width: 8),
        ],
        isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                text,
                style: GoogleFonts.roboto(
                  color: textColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.w700,
                  fontSize: textSize ?? 16,
                  letterSpacing: 0.5,
                ),
              ),
      ],
    );
  }

  Widget _buildTextWithIcon(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: GoogleFonts.roboto(
            color: textColor ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: textSize ?? 16,
            letterSpacing: 0.5,
          ),
        ),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(
            icon,
            size: iconSize ?? 22,
            color: iconColor ?? Colors.white,
          ),
        ],
      ],
    );
  }
}
