import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/recipe/controllers/detail_recipe_controllers.dart';
import 'package:nutri_call_app/features/recipe/widget/meal_dropdown.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_image_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_ingredients_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_nutrition_table_widget.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_steps_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class DetailRecipePage extends HookConsumerWidget {
  const DetailRecipePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailRecipe = ref.watch(fetchDetailRecipeNotifierProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Recipe',
        onBack: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        color: AppColor.semiBlack,
        onRefresh: () async {
          await ref.read(fetchDetailRecipeNotifierProvider.notifier).fetch(
                recipeId: detailRecipe.maybeWhen(
                  data: (data) => data?.id ?? 0,
                  orElse: () => 0,
                ),
              );
        },
        child: detailRecipe.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColor.darkGreen),
          ),
          error: (err, stack) => Center(child: Text("Error: $err")),
          data: (recipe) {
            if (recipe == null) return const Center(child: Text("No data"));
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
                          RecipeImageWidget(imageUrl: recipe.imageUrl ?? ""),
                          const Gap(7),
                          Text.rich(
                            TextSpan(
                              text: "by ",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: AppColor.lightBlack,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: recipe.sumber ?? "-",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.lightBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            recipe.date ?? "-",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: AppColor.lightBlack,
                                fontWeight: FontWeight.w500),
                          ),
                          const Gap(16),
                          Text(
                            recipe.title ?? "No Title",
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColor.semiBlack),
                          ),
                          const Gap(12),
                          RecipeIngredientsWidget(
                            ingredients: recipe.ingredients
                                    ?.map((e) => e.namaBahan ?? '-')
                                    .toList() ??
                                [],
                          ),
                          const Gap(12),
                          RecipeStepsWidget(
                            steps: recipe.steps ?? [],
                          ),
                          const Gap(24),
                          RecipeNutritionTableWidget(
                            nutritionData: {
                              'Energi': "${recipe.energi ?? '-'} kcal",
                              'Protein': "${recipe.protein ?? '-'} g",
                              'Lemak': "${recipe.lemak ?? '-'} g",
                              'Karbohidrat': "${recipe.karbohidrat ?? '-'} g",
                            },
                          ),
                          const Gap(30),
                          const MealDropdown(),
                          const Gap(24),
                          CustomButtonWidget(
                            text: 'Add to Meal Plan',
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
