import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = const Color(0xFF3399FE),
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 48.0,
    this.borderRadius = 25.0,
    this.icon,
    this.iconRight,
    this.disabled = false,
    this.isActive = false,
    this.fontSize = 16.0,
    this.elevation = 0.0,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.color = const Color(0xFF3399FE),
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 48.0,
    this.borderRadius = 25.0,
    this.icon,
    this.iconRight,
    this.disabled = false,
    this.isActive = false,
    this.fontSize = 16.0,
    this.elevation = 0.0,
  });

  final Function() onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final Widget? iconRight;
  final bool disabled;
  final bool isActive;
  final double fontSize;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyle.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                surfaceTintColor: Colors.red,
                shadowColor: Colors.transparent,
                elevation: elevation,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ).copyWith(
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled)) {
                      return AppColor.disableButton;
                    }
                    return color;
                  },
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SizedBox(width: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.montserrat(
                          color: textColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (iconRight != null) ...[
                        const Gap(5),
                        iconRight!,
                      ],
                    ],
                  ),
                ],
              ),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                shadowColor: Colors.transparent,
                elevation: elevation,
                backgroundColor: disabled ? AppColor.darkBlue : color,
                side: const BorderSide(color: Color(0xFFFD6464)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SizedBox(width: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.montserrat(
                          color: disabled ? const Color(0x473399FE) : textColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (iconRight != null) ...[
                        const Gap(5),
                        iconRight!,
                      ],
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
