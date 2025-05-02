import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBack;

  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final Color? leadingBackgroundColor;
  final BorderRadiusGeometry? leadingBorderRadius;

  const CustomAppBar({
    super.key,
    this.title,
    this.onBack,
    this.backgroundColor,
    this.titleStyle,
    this.leadingBackgroundColor,
    this.leadingBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? AppColor.primaryColor,
      leadingWidth: onBack == null ? 0 : 65,
      titleSpacing: 20,
      title: title != null
          ? Text(
              title ?? '',
              style: titleStyle ??
                  GoogleFonts.poppins(
                    color: AppColor.darkGreen,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
            )
          : null,
      leading: onBack != null
          ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: leadingBackgroundColor ?? AppColor.darkGreen,
                  borderRadius:
                      leadingBorderRadius ?? BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    Assets.icons.back.path,
                    width: 20,
                  ),
                  onPressed: onBack,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
