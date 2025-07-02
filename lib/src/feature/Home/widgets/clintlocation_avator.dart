

import 'package:flutter/material.dart';

class BorderedCircleAvatar extends StatelessWidget {
  final String imagePath;
  final Color borderColor;
  final double size;

  const BorderedCircleAvatar({
    super.key,
    required this.imagePath,
    required this.borderColor,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: borderColor, 
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

