import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  const ButtonWidgets({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.width,
    required this.hiegth,
    required this.ontap,
    required this.bgcolor,
    required this.color,
    required this.fontsize,
    required this.fontWeight,
  });

  //! add variable :
  final String text;
  final BorderRadius borderRadius;
  final double width;
  final double hiegth;
  final VoidCallback ontap;
  final Color bgcolor;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: hiegth,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: bgcolor,
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
