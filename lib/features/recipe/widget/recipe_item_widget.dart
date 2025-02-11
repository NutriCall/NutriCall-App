import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class RecipeItem extends StatelessWidget {
  final String avatarUrl;
  final String imageUrl;
  final String title;
  final String author;
  final String date;

  const RecipeItem({
    Key? key,
    required this.avatarUrl,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and Author
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatarUrl),
                  radius: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'by $author',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.darkGrey,
                  ),
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    date,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColor.grey,
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
