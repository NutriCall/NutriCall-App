import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/main/controllers/selected_index_provider.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CalorieConsumptionWidget extends HookConsumerWidget {
  final double calories;
  final double goal;
  const CalorieConsumptionWidget({
    super.key,
    required this.calories,
    required this.goal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = goal == 0 ? 0.0 : (calories / goal).clamp(0.0, 1.0);
    final width = MediaQuery.of(context).size.width - 40;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Calorie Consumption Today',
              style: GoogleFonts.poppins(
                color: AppColor.semiBlack,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(selectedIndexNavBar.notifier).state = 2;
              },
              child: Text(
                'more',
                style: GoogleFonts.poppins(
                  color: AppColor.lightBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        const Gap(10),
        SizedBox(
          height: 32,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: width,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              if (progress > 0)
                Positioned(
                  left: 0,
                  child: Container(
                    width: width * (progress.clamp(0.0, 0.2)),
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColor.disabledGreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              if (progress > 0.2)
                Positioned(
                  left: width * 0.2,
                  child: Container(
                    width: width * (progress > 0.5 ? 0.3 : progress - 0.2),
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColor.lightGreen,
                    ),
                  ),
                ),
              if (progress > 0.5)
                Positioned(
                  left: width * 0.5,
                  child: Container(
                    width: width * (progress - 0.5),
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColor.darkGreen,
                      borderRadius: progress == 1.0
                          ? const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )
                          : null,
                    ),
                  ),
                ),
              if (progress > 0)
                Positioned(
                  left: width * progress - 1,
                  top: -4,
                  child: Container(
                    width: 2,
                    height: 40,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
        const Gap(6),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$calories kcal',
            style: GoogleFonts.poppins(
              color: AppColor.darkGreen,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
