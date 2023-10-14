import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextWidgets extends StatelessWidget {
  const TextWidgets({
    super.key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.color,
  });

  //! add variable :
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
