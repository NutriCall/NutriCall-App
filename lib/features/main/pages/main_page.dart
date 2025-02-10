import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/home/pages/home_page.dart';
import 'package:nutri_call_app/features/main/controllers/selected_index_provider.dart';
import 'package:nutri_call_app/features/main/widget/nav_item.dart';
import 'package:nutri_call_app/features/plan/pages/plan_page.dart';
import 'package:nutri_call_app/features/profile/pages/profile_page.dart';
import 'package:nutri_call_app/features/progress/pages/progress_page.dart';
import 'package:nutri_call_app/features/report/pages/report_page.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class MainPage extends HookConsumerWidget {
  final int id;
  const MainPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(selectedIndexNavBar);
    final List<Widget> selectedPage = <Widget>[
      const HomePage(),
      const ProgressPage(),
      const ReportPage(),
      const PlanPage(),
      const ProfilePage(),
    ];

    void onItemTapped(int index) {
      ref.read(selectedIndexNavBar.notifier).update((state) => index);
    }

    return Scaffold(
      body: selectedPage[selectedIndex],
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          color: AppColor.lightGreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                iconPath: Assets.navbar.home.path,
                isActive: selectedIndex == 0,
                onTap: () {
                  onItemTapped(0);
                },
              ),
              NavItem(
                iconPath: Assets.navbar.progress.path,
                isActive: selectedIndex == 1,
                onTap: () {
                  onItemTapped(1);
                },
                scale: 1.0
              ),
              NavItem(
                iconPath: Assets.navbar.report.path,
                middle: true,
                isActive: selectedIndex == 2,
                onTap: () {
                  onItemTapped(2);
                },
              ),
              NavItem(
                iconPath: Assets.navbar.plan.path,
                isActive: selectedIndex == 3,
                onTap: () {
                  onItemTapped(3);
                },
                scale: 1.0,
              ),
              NavItem(
                iconPath: Assets.navbar.profile.path,
                isActive: selectedIndex == 4,
                onTap: () {
                  onItemTapped(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
