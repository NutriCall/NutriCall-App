import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;
  final bool isOutlined;
  final Color borderColor;

  const CustomButtonWidget({
    super.key,
    required this.text,
    this.backgroundColor = AppColor.darkGreen,
    this.textColor = Colors.white,
    this.onTap,
    this.isOutlined = false,
    this.borderColor = AppColor.darkGreen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : backgroundColor,
          borderRadius: BorderRadius.circular(6),
          border: isOutlined ? Border.all(color: borderColor, width: 2) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
