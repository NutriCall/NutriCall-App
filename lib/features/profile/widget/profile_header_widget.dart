import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class ProfileHeader extends StatelessWidget {
  final String imagePath;
  final String name;
  final String username;

  const ProfileHeader({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.darkGreen,
              width: 3,
            ),
          ),
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.darkGreen,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          username,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: AppColor.grey,
          ),
        ),
      ],
    );
  }
}
