import 'package:flutter/material.dart';
import 'package:young_innovation/utils/color.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;

  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.fontWeight = FontWeight.normal,
      this.textOverflow = TextOverflow.visible,
      this.maxLines = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
