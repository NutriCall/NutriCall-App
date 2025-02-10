import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class ProfileDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 4),
      child: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Expanded(
              flex: 2,
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColor.grey,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Gap(10),
            Text(
              ':',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColor.grey,
              ),
            ),
            const Gap(10),
            Expanded(
              flex: 4,
              child: Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGrey,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
    );
  }
}
