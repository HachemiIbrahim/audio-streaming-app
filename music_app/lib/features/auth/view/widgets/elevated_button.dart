import 'package:flutter/material.dart';
import 'package:music_app/core/theme/pallete.dart';

class CustomElevatedButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const CustomElevatedButton(
      {super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final querry = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient1,
            Pallete.gradient2,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
          fixedSize: Size(querry.width, querry.height * 0.05),
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
