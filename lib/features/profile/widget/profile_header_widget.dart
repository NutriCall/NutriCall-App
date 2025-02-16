import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class ProfileHeader extends StatelessWidget {
  final String imagePath;
  final String name;
  final String username;

  const ProfileHeader({
    super.key,
    required this.imagePath,
    required this.name,
    required this.username,
  });

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
        const Gap(15),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.darkGreen,
          ),
        ),
        const Gap(5),
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
