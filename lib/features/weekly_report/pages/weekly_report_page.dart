import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';

class WeeklyReportPage extends HookConsumerWidget {
  const WeeklyReportPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Weekly Report',
        onBack: (){
          context.pop();
        },
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Text('Weekly Report Page'),
        ),
      ),
    );
  }
}
