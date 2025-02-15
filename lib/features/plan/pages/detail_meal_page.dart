import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/plan/widget/quantity_selector.dart';
import 'package:nutri_call_app/features/plan/widget/size_dropdown.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';

class DetailMealPage extends StatelessWidget {
  final String id;
  final String name;
  final int initialQuantity;
  final String initialSize;
  final bool isEditable;

  const DetailMealPage({
    Key? key,
    required this.id,
    required this.name,
    this.initialQuantity = 1,
    this.initialSize = 'medium',
    this.isEditable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Meal',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quantity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    QuantitySelector(
                      initialValue: initialQuantity,
                      isEditable: isEditable,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Size',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    SizeDropdown(
                      initialSize: initialSize,
                      isEditable: isEditable,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const CustomButtonWidget(text: 'Save')
          ],
        ),
      ),
    );
  }
}
