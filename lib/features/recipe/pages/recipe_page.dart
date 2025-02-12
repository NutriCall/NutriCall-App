import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/recipe/widget/floating_action_button.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_item_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

final List<Map<String, String>> recipes = [
  {
    "avatarUrl": Assets.images.userProfile.path,
    "imageUrl": Assets.images.bananaSplit.path,
    "title": "Banana split",
    "author": "leonardochris",
    "date": "15 January 2025"
  },
  {
    "avatarUrl": Assets.images.userProfile.path,
    "imageUrl": Assets.images.chickenKatsu.path,
    "title": "Chicken Katsu",
    "author": "leonardochris",
    "date": "14 January 2025"
  },
  {
    "avatarUrl": Assets.images.userProfile.path,
    "imageUrl": Assets.images.sopIga.path,
    "title": "Sop Iga",
    "author": "leonardochris",
    "date": "13 January 2025"
  }
];

class RecipePage extends HookConsumerWidget {
  const RecipePage({super.key});

  Future<void> _refreshRecipes() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Recipes',
        onBack: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        color: AppColor.semiBlack,
        onRefresh: _refreshRecipes,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return RecipeItem(
                avatarUrl: recipe['avatarUrl']!,
                imageUrl: recipe['imageUrl']!,
                title: recipe['title']!,
                author: recipe['author']!,
                date: recipe['date']!,
              );
            },
          ),
        ),
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
    );
  }
}
