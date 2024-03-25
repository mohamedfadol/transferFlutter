import 'package:flutter/material.dart';
import '../../helpers/themes.dart';

class TitleGradientBar extends StatelessWidget {
  const TitleGradientBar({
    super.key,
    required this.title,
    required this.email,
  });

  final String title;
  final String email;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ThemeColors.gradientStart,
            ThemeColors.gradientEnd,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(title),
          Text(email),
        ],
      ),
    );
  }
}