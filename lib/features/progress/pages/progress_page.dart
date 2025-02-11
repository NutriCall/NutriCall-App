import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/progress/widget/circular_percent_widget.dart';
import 'package:nutri_call_app/features/progress/widget/line_percent_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class ProgressPage extends HookConsumerWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Progress',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView( 
          child: Column(
            children: [
              CircularPercentWidget(
                percent: 0.3, 
                progressColor: AppColor.darkGreen, 
                backgroundColor: AppColor.disabledGreen, 
                value1: '1212', 
                value2: 'kcal remaining',
              ),
              Gap(10),
              LinePercentWidget(
                title: 'Carbs', 
                percent: 0.2, 
                progressColor: AppColor.blue, 
                valueText: '13 / 228 g',
              ),
               Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}


