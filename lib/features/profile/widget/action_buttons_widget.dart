import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/features/profile/pages/edit_profile_page.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.darkGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: Text(
              'Edit',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColor.darkGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(
                color: AppColor.darkGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
