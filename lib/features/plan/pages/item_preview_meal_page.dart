import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/plan/pages/add_meals_page.dart';
import 'package:nutri_call_app/features/recipe/pages/add_recipe_page.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_nutrition_table_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';
import 'package:nutri_call_app/features/plan/controllers/post_temporary_controller.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_field.dart';

class ItemPreviewMealPage extends ConsumerStatefulWidget {
  final String id;
  final String name;
  final String? initialImage;
  final int initialQuantity;
  final String initialSize;
  final String initialDescription;
  final bool isEditable;
  final double size;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;
  final String type;

  const ItemPreviewMealPage({
    super.key,
    required this.id,
    required this.name,
    this.initialImage,
    this.initialQuantity = 1,
    this.initialSize = 'gram',
    this.initialDescription = 'a piece of chicken with rice',
    this.isEditable = false,
    this.size = 0.0,
    this.calories = 0.0,
    this.protein = 0.0,
    this.fat = 0.0,
    this.carbs = 0.0,
    required this.type,
  });

  @override
  _ItemPreviewMealPageState createState() => _ItemPreviewMealPageState();
}

class _ItemPreviewMealPageState extends ConsumerState<ItemPreviewMealPage> {
  bool _isLoading = false;
  late String image;

  @override
  void initState() {
    image = widget.initialImage ?? Assets.images.chickenKatsu.path;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mealState = AsyncValue.data({
      "nutritionData": {
        "Calories": '${widget.calories} kcal',
        "Total Fat": '${widget.fat} g',
        "Total Carbohydrates": '${widget.carbs} g',
        "Proteins": '${widget.protein} g',
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Preview Meal',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        color: AppColor.semiBlack,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.poppins(
                    color: AppColor.semiBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: CustomTextField(
                            label: 'Size per gram',
                            suffixText: 'gram',
                            controller: TextEditingController(
                                text: widget.size.toString()),
                            errorText: null,
                            readOnly: true,
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
                  final nutritionData = meal["nutritionData"] ?? {};
                  return RecipeNutritionTableWidget(
                      nutritionData: nutritionData);
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Text(
                  'Failed to load nutrition data',
                  style: GoogleFonts.poppins(color: Colors.red),
                ),
              ),
              const Gap(36),
              CustomButtonWidget(
                text: _isLoading ? 'Loading..' : 'Save',
                onTap: _isLoading
                    ? null
                    : () {
                        setState(() => _isLoading = true);
                        ref.read(postTemporaryNotifierProvider.notifier).post(
                              params: PostTemporaryParams(
                                compositionId: widget.id,
                                type: widget.type,
                              ),
                              onSuccess: (data) {
                                setState(() => _isLoading = false);
                                if (widget.type == 'Ingredients') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddRecipePage()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddMealsPage(mealId: widget.type),
                                    ),
                                  );
                                }
                              },
                              onFailed: (error) {
                                setState(() => _isLoading = false);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Failed: $error')),
                                );
                              },
                            );
                      },
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
