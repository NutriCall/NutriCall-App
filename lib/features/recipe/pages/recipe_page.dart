import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/home/pages/home_page.dart';
import 'package:nutri_call_app/features/recipe/controllers/detail_recipe_controllers.dart';
import 'package:nutri_call_app/features/recipe/controllers/get_list_recipe_controllers.dart';
import 'package:nutri_call_app/features/recipe/widget/floating_action_button.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_item_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class RecipePage extends HookConsumerWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listRecipe = ref.watch(fetchListRecipeControllersProvider);
    final isLoading = ref.watch(recipeLoadingProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            title: 'Recipes',
            onBack: () {
              context.pop();
            },
          ),
          body: listRecipe.when(
            loading: () => const Center(
                child: CircularProgressIndicator(
              color: AppColor.darkGreen,
            )),
            error: (error, _) => Center(child: Text('Error: $error')),
            data: (recipes) {
              if (recipes == null || recipes.isEmpty) {
                return Center(
                    child: Text(
                  'No recipes found',
                  style: GoogleFonts.poppins(
                      color: AppColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ));
              }
              return RefreshIndicator(
                color: AppColor.semiBlack,
                onRefresh: () async {
                  await ref
                      .read(fetchListRecipeControllersProvider.notifier)
                      .fetch();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return GestureDetector(
                        onTap: () {
                          ref.read(recipeLoadingProvider.notifier).state = true;
                          ref
                              .read(fetchDetailRecipeNotifierProvider.notifier)
                              .fetch(
                                  recipeId: recipe.id ?? 0,
                                  onSuccess: () {
                                    ref
                                        .read(recipeLoadingProvider.notifier)
                                        .state = false;
                                    context
                                        .pushNamed(RouteName.detailRecipePage);
                                  },
                                  onFailed: () {
                                    ref
                                        .read(recipeLoadingProvider.notifier)
                                        .state = false;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Failed to get data'),
                                      ),
                                    );
                                  });
                        },
                        child: RecipeItem(
                          avatarUrl: recipe.userImage ?? '',
                          imageUrl: recipe.imageUrl ?? '',
                          title: recipe.name ?? '',
                          author: recipe.userFullName ?? 'Unknown',
                          date: recipe.date ?? '',
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          floatingActionButton: Transform.translate(
            offset: const Offset(0, -20),
            child: AddButton(
              onTap: () {
                context.pushNamed(RouteName.addRecipePage);
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
        if (isLoading)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColor.darkGreen,
              ),
            ),
          ),
      ],
    );
  }
}
