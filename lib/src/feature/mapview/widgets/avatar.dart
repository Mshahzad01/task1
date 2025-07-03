import 'package:flutter/material.dart';

class BlurAvatar extends StatelessWidget {
  const BlurAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 185,
          height: 185,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.6),
                blurRadius: 10,
                spreadRadius: 04,
              ),
            ],
          ),
        ),

        Container(
          width: 180,
          height: 180,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          ),
        ),
      ],
    );
  }
}
