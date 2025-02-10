import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';

class PlanPage extends HookConsumerWidget {
  const PlanPage({super.key});
   @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Meal Plan',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Text('Plan Page'),
        ),
      ),
    );
  }
}
