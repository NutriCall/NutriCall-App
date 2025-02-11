import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomPromptText extends StatelessWidget {
  final String labelText;
  final String actionText;
  final VoidCallback onPressed;

  const CustomPromptText({
    Key? key,
    required this.labelText,
    required this.actionText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColor.grey,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColor.darkGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
