import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';

class ReportPage extends HookConsumerWidget {
  const ReportPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Daily Report',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Text('Report Page'),
        ),
      ),
    );
  }
}
