import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class RecipeItem extends StatelessWidget {
  final String avatarUrl;
  final String imageUrl;
  final String title;
  final String author;
  final String date;

  const RecipeItem({
    super.key,
    required this.avatarUrl,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatarUrl),
                  radius: 16,
                ),
                const Gap(8),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColor.lightBlack,
                    ),
                    children: [
                      const TextSpan(
                        text: 'by ',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: author,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.semiBlack,
                  ),
                ),
                const Gap(4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    date,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColor.lightBlack,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
