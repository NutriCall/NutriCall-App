import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_image_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_ingredients_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_nutrition_table_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_steps_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

final previewRecipeProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  return {
    "imageUrl": Assets.images.chickenKatsu.path,
    "title": "Chicken Katsu",
    "ingredients": ["Bawang Putih", "Bawang Merah", "Ayam", "Terigu"],
    "steps": [
      "Campurkan semua bahan.",
      "Goreng ayam hingga matang.",
      "Sajikan dengan saus."
    ],
    "nutritionData": {
      "Calories": "210 (4%)",
      "Total Fat": "0,8g",
      "Total Carbohydrates": "53,8g",
      "Proteins": "2,6g"
    }
  };
});

class PreviewRecipePage extends HookConsumerWidget {
  const PreviewRecipePage({super.key});

  Future<void> _refreshRecipes(WidgetRef ref) async {
    ref.invalidate(previewRecipeProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeAsync = ref.watch(previewRecipeProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Preview Recipe',
        onBack: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        color: AppColor.semiBlack,
        onRefresh: () => _refreshRecipes(ref),
        child: recipeAsync.when(
          loading: () => const Center(
              child: CircularProgressIndicator(
            color: AppColor.darkGreen,
          )),
          error: (err, stack) =>
              Center(child: Text("Error: $err", style: GoogleFonts.poppins())),
          data: (recipe) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RecipeImageWidget(imageUrl: recipe["imageUrl"]),
                          const Gap(16),
                          Text(
                            recipe["title"],
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(12),
                          RecipeIngredientsWidget(
                            ingredients:
                                List<String>.from(recipe["ingredients"]),
                          ),
                          const Gap(12),
                          RecipeStepsWidget(
                            steps: List<String>.from(recipe["steps"]),
                          ),
                          const Gap(24),
                          RecipeNutritionTableWidget(
                            nutritionData: Map<String, String>.from(
                                recipe["nutritionData"]),
                          ),
                          const Gap(24),
                          CustomButtonWidget(
                            text: 'Publish',
                            onTap: () {
                              context.pushNamed(RouteName.recipePage);
                            },
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
