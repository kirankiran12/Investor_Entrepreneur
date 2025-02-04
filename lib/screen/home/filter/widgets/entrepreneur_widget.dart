import 'package:flutter/material.dart';

class EntrepreneurButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isSelected;
  const EntrepreneurButtonWidget({super.key,
  required this.text,
  required this.onTap,
  required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 8.0,bottom: 8),
      child: GestureDetector(
        onTap: (){
          onTap();
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.purple,
                    Colors.red,
                    Colors.orange
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : null,
                color: isSelected ? null : Colors.grey.withValues(alpha: (0.8 * 255).toDouble()),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(text,
                style: TextStyle(color: isSelected ? Colors.white : Colors.black),
              )),
        ),
      ),
    );
  }
}
