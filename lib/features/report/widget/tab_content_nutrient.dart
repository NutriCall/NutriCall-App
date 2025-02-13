import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/report/widget/custom_table_widget.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class TabContentNutrient extends HookConsumerWidget {
  const TabContentNutrient({super.key});

    Future<void> _refreshCalorie() async {
      await Future.delayed(const Duration(seconds: 2));
    }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<List<String>> dataNutrient = [
      ["Nutrient", "Total", "Goal", "[+/-]"],
      ["Calories (kcal)", "300", "15400", "-15100"],
      ["Protein (g)", "31", "700", "-669"],
      ["Carbohydrate (g)", "27", "1750", "-1723"],
      ["Fiber (g)", "3", "-", "-"],
      ["Sugar (g)", "14", "-", "-"],
      ["Fat (g)", "8", "469", "-461"],
      ["Saturated Fat (g)", "2", "-", "-"],
      ["Polyunsaturated Fat (g)", "2", "-", "-"],
      ["Monounsaturated Fat (g)", "3", "-", "-"],
      ["Cholesterol (mg)", "83", "-", "-"],
      ["Sodium (mg)", "394", "-", "-"],
      ["Potassium (mg)", "665", "-", "-"],
    ];

    return RefreshIndicator(
      onRefresh: _refreshCalorie,
      color: AppColor.semiBlack,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.darkGreen,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today’s Nutrient',
                            style: GoogleFonts.poppins(
                              color: AppColor.semiBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(8),
                          CustomTableWidget(
                            rowCount: 13,
                            columnCount: 4,
                            data: dataNutrient
                          )
                        ]
                      ),
                    ],
                  ),
                ),
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}