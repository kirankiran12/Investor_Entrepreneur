import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 35.0, // Default Size 35
    this.color = Colors.black, // Default Color Black
    this.fontWeight = FontWeight.bold, // Default Bold
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}



class HeadingCustomText extends StatelessWidget {
  const HeadingCustomText({super.key, required String text});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom Text Widget 🚀")),
        body: const Center(
          child: CustomText(
            text: "Hello, Flutter Dev! 🎉🔥",
          ),
        ),
      ),
    );
  }
}

