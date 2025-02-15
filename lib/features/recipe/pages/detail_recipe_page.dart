import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/recipe/widget/meal_dropdown.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_image_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_ingredients_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_nutrition_table_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_steps_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

final detailRecipeProvider = FutureProvider.family
    .autoDispose<Map<String, dynamic>, String>((ref, id) async {
  final recipes = [
    {
      "id": "1",
      "imageUrl": Assets.images.bananaSplit.path,
      "author": "leonardochris",
      "date": "15 January 2025",
      "title": "Banana Split",
      "ingredients": ["Pisang", "Es Krim", "Coklat"],
      "steps": [
        "Potong pisang.",
        "Tambahkan es krim di atasnya.",
        "Sajikan dengan saus coklat."
      ],
      "nutritionData": {
        "Calories": "300 kcal",
        "Total Fat": "10g",
        "Carbs": "40g",
        "Proteins": "5g"
      }
    },
    {
      "id": "2",
      "imageUrl": Assets.images.chickenKatsu.path,
      "author": "leonardochris",
      "date": "14 January 2025",
      "title": "Chicken Katsu",
      "ingredients": ["Ayam", "Tepung", "Telur", "Breadcrumbs"],
      "steps": [
        "Lumuri ayam dengan tepung dan telur.",
        "Balur dengan breadcrumbs.",
        "Goreng hingga kecoklatan."
      ],
      "nutritionData": {
        "Calories": "250 kcal",
        "Total Fat": "12g",
        "Carbs": "20g",
        "Proteins": "15g"
      }
    },
    {
      "id": "3",
      "imageUrl": Assets.images.sopIga.path,
      "author": "leonardochris",
      "date": "13 January 2025",
      "title": "Sop Iga",
      "ingredients": ["Iga", "Wortel", "Kentang", "Bawang"],
      "steps": [
        "Rebus iga hingga empuk.",
        "Tambahkan wortel dan kentang.",
        "Sajikan dengan bawang goreng."
      ],
      "nutritionData": {
        "Calories": "200 kcal",
        "Total Fat": "8g",
        "Carbs": "30g",
        "Proteins": "10g"
      }
    }
  ];

  final recipe =
      recipes.firstWhere((recipe) => recipe["id"] == id, orElse: () => {});
  if (recipe.isEmpty) {
    throw Exception("Recipe not found");
  }

  return recipe;
});

class DetailRecipePage extends HookConsumerWidget {
  final String id;

  const DetailRecipePage({super.key, required this.id});

  Future<void> _refreshRecipes(WidgetRef ref) async {
    ref.invalidate(detailRecipeProvider(id));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeAsync = ref.watch(detailRecipeProvider(id));

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Recipe',
        onBack: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        color: AppColor.semiBlack,
        onRefresh: () => _refreshRecipes(ref),
        child: recipeAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text("Error: $err")),
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
                          const SizedBox(height: 7),
                          Text.rich(
                            TextSpan(
                              text: "by ",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: AppColor.grey),
                              children: [
                                TextSpan(
                                  text: recipe["author"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            recipe["date"],
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: AppColor.grey),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            recipe["title"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          RecipeIngredientsWidget(
                              ingredients:
                                  List<String>.from(recipe["ingredients"])),
                          const SizedBox(height: 12),
                          RecipeStepsWidget(
                              steps: List<String>.from(recipe["steps"])),
                          const SizedBox(height: 12),
                          RecipeNutritionTableWidget(
                              nutritionData: Map<String, String>.from(
                                  recipe["nutritionData"])),
                          const SizedBox(height: 20),
                          const MealDropdown(),
                          const SizedBox(height: 20),
                          CustomButtonWidget(
                            text: 'Add to Meal Plan',
                            onTap: () {
                              context.pushNamed(RouteName.recipePage);
                            },
                          ),
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
