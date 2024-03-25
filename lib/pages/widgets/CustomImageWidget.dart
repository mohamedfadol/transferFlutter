import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImageWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomImageWidget({
    super.key,
    required this.imagePath,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
