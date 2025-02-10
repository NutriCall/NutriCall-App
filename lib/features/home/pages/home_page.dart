import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/home/widget/calorie_consumption_widget.dart';
import 'package:nutri_call_app/features/home/widget/menu_home_widget.dart';
import 'package:nutri_call_app/features/home/widget/nutricall_banner_widget.dart';
import 'package:nutri_call_app/features/home/widget/user_header_widget.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children:  [
              const UserProfileHeader(),
              const Gap(10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: NutricallBanner(),
              ),
              const Gap(22),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CalorieConsumptionWidget(),
              ),
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MenuHomeWidget(
                  title: 'Weekly Report', 
                  assetPath: Assets.images.plan.path,
                  backgroundColor: AppColor.lightOrange, 
                  textColor: AppColor.orange,
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MenuHomeWidget(
                  title: 'Healthy Food Recipes', 
                  assetPath: Assets.images.recipe.path,
                  backgroundColor: AppColor.lightBlue, 
                  textColor: AppColor.blue,
                  imageScale: 1.0,
                ),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
