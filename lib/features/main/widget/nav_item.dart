import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class NavItem extends StatelessWidget {
  final String iconPath;
  final bool isActive;
  final bool middle;
  final double scale; // Tambahkan parameter scale
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.iconPath,
    required this.isActive,
    required this.onTap,
    this.middle = false,
    this.scale = 0.8, 
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
                    color: middle ? AppColor.darkGreen : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Transform.scale(
                    scale: scale,
                    child: SvgPicture.asset(
                      iconPath,
                      fit: BoxFit.contain,
                      colorFilter: isActive
                          ? middle
                              ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                              : const ColorFilter.mode(AppColor.darkGreen, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
