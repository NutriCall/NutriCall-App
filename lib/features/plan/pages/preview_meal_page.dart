import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_image_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_nutrition_table_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
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
  final String? initialImage;
  final int initialQuantity;
  final String initialSize;
  final String initialDescription;
  final bool isEditable;

  const PreviewMealPage({
    super.key,
    required this.id,
    required this.name,
    this.initialImage,
    this.initialQuantity = 1,
    this.initialSize = '500 gr',
    this.initialDescription = 'a piece of chicken with rice',
    this.isEditable = false,
  });

  @override
  _PreviewMealPageState createState() => _PreviewMealPageState();
}

class _PreviewMealPageState extends ConsumerState<PreviewMealPage> {
  late String image;

  @override
  void initState() {
    image = widget.initialImage ?? Assets.images.chickenKatsu.path;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mealState = ref.watch(previewMealProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Preview Meal',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(previewMealProvider);
        },
        color: AppColor.semiBlack,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeImageWidget(imageUrl: image),
              const Gap(16),
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.darkGreen, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.initialDescription,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: AppColor.darkGreen,
                          ),
                        ),
                        const Gap(8),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.darkGreen, width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              widget.initialQuantity.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: AppColor.darkGreen,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                        Text(
                          'Size',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: AppColor.darkGreen,
                          ),
                        ),
                        const Gap(8),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.darkGreen, width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              widget.initialSize,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: AppColor.darkGreen,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(16),
              mealState.when(
                data: (meal) {
                  final nutritionData =
                      meal["nutritionData"] as Map<String, String>? ?? {};
                  return RecipeNutritionTableWidget(
                      nutritionData: nutritionData);
                },
                loading: () => const Center(
                    child: CircularProgressIndicator(
                  color: AppColor.darkGreen,
                )),
                error: (error, _) => Text(
                  'Failed to load nutrition data',
                  style: GoogleFonts.poppins(color: Colors.red),
                ),
              ),
              const Gap(36),
              const CustomButtonWidget(text: 'Add to List'),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
