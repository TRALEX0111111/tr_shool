import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    required this.ontap,
    required this.color,
    required this.fontsize,
    required this.fontWeight,
  });

  //! add variable :
  final String text;
  final VoidCallback ontap;
  final Color? color;
  final double fontsize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AutoSizeText(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
