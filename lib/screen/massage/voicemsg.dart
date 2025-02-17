// import 'package:flutter/material.dart';

// class VoiceProgressBar extends StatefulWidget {
//   const VoiceProgressBar({super.key});

//   @override
//   _VoiceProgressBarState createState() => _VoiceProgressBarState();
// }

// class _VoiceProgressBarState extends State<VoiceProgressBar> with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   double volume = 0.5; 

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
//     _controller!.repeat(reverse: true); 
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller!,
//       builder: (context, child) {
//         return CustomPaint(
//           size: Size(200, 50), 
//           painter: ProgressBarPainter(volume: volume),
//         );
//       },
//     );
//   }
// }

// class ProgressBarPainter extends CustomPainter {
//   final double volume;
//   ProgressBarPainter({required this.volume});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;
    
   
//     canvas.drawRect(Rect.fromLTWH(0, 0, size.width * volume, size.height), paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }


