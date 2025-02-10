import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final bool middle;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.middle = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            const Gap(8),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: middle ? 60.0 : 50.0,
                  height: middle ? 60.0 : 60.0,
                  decoration: BoxDecoration(
                    color: middle ? AppColor.lightPurple : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: middle ? 20 : 25,
                  width: middle ? 20 : 25,
                  child: SvgPicture.asset(iconPath,
                      fit: BoxFit.cover,
                      colorFilter: isActive
                          ? middle
                              ? const ColorFilter.mode(AppColor.textColor, BlendMode.srcIn)
                              : const ColorFilter.mode(AppColor.lightPurple, BlendMode.srcIn)
                          : null),
                ),
              ],
            ),
            const Gap(4),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10)
          ],
        ),
      ),
    );
  }
}
