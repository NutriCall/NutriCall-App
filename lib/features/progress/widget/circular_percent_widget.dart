import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentWidget extends HookConsumerWidget {
  final double percent;
  final Color progressColor;
  final Color backgroundColor;
  final String value1;
  final String value2;

  const CircularPercentWidget({
    super.key,
    required this.percent,
    required this.progressColor,
    required this.backgroundColor,
    required this.value1,
    required this.value2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CircularPercentIndicator(
        radius: 80.0,
        lineWidth: 28.0,
        percent: percent,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value1,
              style: GoogleFonts.poppins(
                color: AppColor.darkGreen,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              value2,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 9,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        progressColor: progressColor,
        backgroundColor: backgroundColor,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
