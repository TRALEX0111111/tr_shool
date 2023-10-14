import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.bgcolor,
    required this.text,
    required this.color,
    required this.fontsize,
    required this.fontWeight,
    required this.onTap,
    required this.borderRadius,
  });

  final double width;
  final double height;
  final Color bgcolor;
  final String text;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  final VoidCallback onTap;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: AutoSizeText(
            text,
            style: TextStyle(
              color: color,
              fontSize: fontsize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
