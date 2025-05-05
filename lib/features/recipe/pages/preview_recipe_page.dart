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

class PreviewRecipePageArgs {
  final String recipeId;
  final String imageUrl;
  final String title;
  final List<Map<String, dynamic>> ingredients;
  final List<String> steps;
  final double energi;
  final double protein;
  final double lemak;
  final double karbohidrat;
  final String compositionId;

  PreviewRecipePageArgs({
    required this.recipeId,
    required this.imageUrl,
    required this.title,
    required this.ingredients,
    required this.steps,
    required this.energi,
    required this.protein,
    required this.lemak,
    required this.karbohidrat,
    required this.compositionId,
  });

  Map<String, dynamic> toJson() {
    return {
      'recipeId': recipeId,
      'imageUrl': imageUrl,
      'title': title,
      'ingredients': ingredients,
      'steps': steps,
      'energi': energi,
      'protein': protein,
      'lemak': lemak,
      'karbohidrat': karbohidrat,
      'compositionId': compositionId,
    };
  }

  factory PreviewRecipePageArgs.fromJson(Map<String, dynamic> json) {
    return PreviewRecipePageArgs(
      recipeId: json['id'].toString(),
      imageUrl: json['image_url'],
      title: json['title'],
      ingredients: List<Map<String, dynamic>>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      energi: json['energi'],
      protein: json['protein'],
      lemak: json['lemak'],
      karbohidrat: json['karbohidrat'],
      compositionId: json['composition_id'].toString(),
    );
  }
}

class PreviewRecipePage extends HookConsumerWidget {
  final PreviewRecipePageArgs previewRecipePageArgs;
  const PreviewRecipePage({
    super.key,
    required this.previewRecipePageArgs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Preview Recipe',
        onBack: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        color: AppColor.semiBlack,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RecipeImageWidget(
                          imageUrl: previewRecipePageArgs.imageUrl),
                      const Gap(16),
                      Text(
                        previewRecipePageArgs.title,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(12),
                      RecipeIngredientsWidget(
                        ingredients: previewRecipePageArgs.ingredients
                            .map((ingredient) =>
                                ingredient["nama_bahan"] as String)
                            .toList(),
                      ),
                      const Gap(12),
                      RecipeStepsWidget(
                        steps: List<String>.from(previewRecipePageArgs.steps),
                      ),
                      const Gap(24),
                      RecipeNutritionTableWidget(nutritionData: {
                        "Calories": "${previewRecipePageArgs.energi} kcal",
                        "Total Fat": "${previewRecipePageArgs.lemak} g",
                        "Total Carbohydrates":
                            "${previewRecipePageArgs.karbohidrat} g",
                        "Proteins": "${previewRecipePageArgs.protein} g",
                      }),
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
        ),
      ),
    );
  }
}
