import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextDirection? textDirection;
  CustomText({required this.text ,this.textStyle , super.key, this.textDirection});
  final DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle,textDirection: textDirection,);
  }
}
