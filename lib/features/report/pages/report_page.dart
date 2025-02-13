import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/report/widget/tab_content_calorie.dart.dart';
import 'package:nutri_call_app/features/report/widget/tab_content_macros.dart';
import 'package:nutri_call_app/features/report/widget/tab_content_nutrient.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = [
    const Tab(text: 'Calories'),
    const Tab(text: 'Macros'),
    const Tab(text: 'Nutrient'),
  ];

  late final TabController _tabController;

  Future<void> _refreshReport() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshReport,
      color: AppColor.semiBlack,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Report'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                tabs: _tabs,
                labelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                labelColor: Colors.black,
                indicatorColor: AppColor.darkGreen,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    TabContentCalorie(),
                    TabContentMacros(),
                    TabContentNutrient(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
