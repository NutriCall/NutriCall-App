import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CalorieConsumptionWidget extends StatelessWidget {
  const CalorieConsumptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = 0.8; 
    double width = MediaQuery.of(context).size.width - 40;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Calorie Consumption Today',
              style: GoogleFonts.montserrat(
                color: AppColor.semiBlack,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'more',
              style: GoogleFonts.montserrat(
                color: AppColor.lightBlack,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Gap(10),
        Stack(
          children: [
            Container(
              width: width,
              height: 32,
              decoration: BoxDecoration(
                color: AppColor.lightGrey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            Positioned(
              left: 0,
              child: Container(
                width: width * 0.2,
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
                  height: 100, 
                  color: Colors.black, 
                ),
              ),
          ],
        ),
      ],
    );
  }
}

