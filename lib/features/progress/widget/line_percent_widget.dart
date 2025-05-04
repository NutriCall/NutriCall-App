import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinePercentWidget extends HookConsumerWidget {
  final String title;
  final double percent;
  final Color progressColor;
  final String valueText;

  const LinePercentWidget({
    super.key,
    required this.title,
    required this.percent,
    required this.progressColor,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 8,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(6),
        LinearPercentIndicator(
          width: 66.0,
          lineHeight: 8.0,
          percent: percent,
          progressColor: progressColor,
          backgroundColor: AppColor.lightBlack,
          barRadius: const Radius.circular(5),
          alignment: MainAxisAlignment.center,
        ),
        const Gap(6),
        Text(
          valueText,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 6,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
