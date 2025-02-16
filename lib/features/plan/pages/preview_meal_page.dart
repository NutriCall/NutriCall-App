import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/plan/widget/quantity_selector.dart';
import 'package:nutri_call_app/features/plan/widget/size_dropdown.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_image_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_nutrition_table_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_description_input.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

final previewMealProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  return {
    "nutritionData": {
      "Calories": "210 (4%)",
      "Total Fat": "0,8g",
      "Total Carbohydrates": "53,8g",
      "Proteins": "2,6g"
    }
  };
});

class PreviewMealPage extends ConsumerStatefulWidget {
  final String id;
  final String name;
  final int initialQuantity;
  final String initialSize;
  final bool isEditable;

  const PreviewMealPage({
    super.key,
    required this.id,
    required this.name,
    this.initialQuantity = 1,
    this.initialSize = 'medium',
    this.isEditable = false,
  });

  @override
  _PreviewMealPageState createState() => _PreviewMealPageState();
}

class _PreviewMealPageState extends ConsumerState<PreviewMealPage> {
  late int quantity;
  late String size;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
    size = widget.initialSize;
  }

  @override
  Widget build(BuildContext context) {
    final mealState = ref.watch(previewMealProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Meal',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(previewMealProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(8),
              RecipeImageWidget(imageUrl: Assets.images.chickenKatsu.path),
              const CustomDescriptionInput(
                label: "",
                placeholder:
                    'Describe your meal, for example “a piece of chicken with rice”.',
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Quantity',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColor.darkGreen,
                            )),
                        const Gap(8),
                        SizedBox(
                          width: double.infinity,
                          child: QuantitySelector(
                            initialValue: quantity,
                            isEditable: widget.isEditable,
                            onChanged: (value) {
                              setState(() {
                                quantity = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Size',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColor.darkGreen,
                            )),
                        const Gap(8),
                        SizedBox(
                          width: double.infinity,
                          child: SizeDropdown(
                            initialSize: size,
                            isEditable: widget.isEditable,
                            onChanged: (value) {
                              setState(() {
                                size = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(5),
              mealState.when(
                data: (meal) {
                  final nutritionData =
                      meal["nutritionData"] as Map<String, String>? ?? {};
                  return RecipeNutritionTableWidget(
                      nutritionData: nutritionData);
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Text(
                  'Failed to load nutrition data',
                  style: GoogleFonts.poppins(color: Colors.red),
                ),
              ),
              const Gap(24),
              const CustomButtonWidget(text: 'Add to List'),
            ],
          ),
        ),
      ),
    );
  }
}
