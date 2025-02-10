import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuHomeWidget extends StatelessWidget {
  final String title;
  final String assetPath;
  final Color backgroundColor;
  final Color textColor;
  final double imageScale; 

  const MenuHomeWidget({
    super.key,
    required this.title,
    required this.assetPath,
    required this.backgroundColor,
    required this.textColor,
    this.imageScale = 0.7, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Center(
          child: Row(
            children: [
              Transform.scale(
                scale: imageScale,
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

