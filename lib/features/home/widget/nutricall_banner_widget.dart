import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class NutricallBanner extends StatelessWidget {
  const NutricallBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.disabledGreen,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NutriCall',
                      style: GoogleFonts.montserrat(
                        color: AppColor.darkGreen,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Call Your Nutrition, Recall Your Health!',
                      style: GoogleFonts.montserrat(
                        color: AppColor.lightBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Transform.scale(
                  scale: 1.2,
                  child: Image.asset(
                    Assets.images.logoApp.path,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
