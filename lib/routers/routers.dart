import 'package:go_router/go_router.dart';
import 'package:nutri_call_app/core/provider/user_manager_provider.dart';
import 'package:nutri_call_app/features/auth/pages/sign_up_page.dart';
import 'package:nutri_call_app/features/main/pages/main_page.dart';
import 'package:nutri_call_app/features/plan/pages/add_meals_page.dart';
import 'package:nutri_call_app/features/plan/pages/detail_meal_page.dart';
import 'package:nutri_call_app/features/plan/pages/item_detail_meal_page.dart';
import 'package:nutri_call_app/features/plan/pages/item_preview_meal_page.dart';
import 'package:nutri_call_app/features/plan/pages/plan_page.dart';
import 'package:nutri_call_app/features/plan/pages/preview_meal_page.dart';
import 'package:nutri_call_app/features/recipe/pages/add_recipe_page.dart';
import 'package:nutri_call_app/features/recipe/pages/add_ingredients_page.dart';
import 'package:nutri_call_app/features/recipe/pages/detail_recipe_page.dart';
import 'package:nutri_call_app/features/recipe/pages/preview_recipe_page.dart';
import 'package:nutri_call_app/features/recipe/pages/recipe_page.dart';
import 'package:nutri_call_app/features/splashscreen/splashscreen.dart';
import 'package:nutri_call_app/features/weekly_report/pages/weekly_report_page.dart';
import 'package:nutri_call_app/features/profile/pages/edit_profile_page.dart';
import 'package:nutri_call_app/features/auth/pages/login_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router_name.dart';

part 'routers.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
    initialLocation: RouteName.splashscreen,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/splashscreen',
        name: RouteName.splashscreen,
        builder: (context, state) => const Splashscreen(),
        redirect: (context, state) async {
          final user = await ref.watch(userManagerProvider.future);
          final auth = await user.hasUser();
          if (auth == true) {
            return RouteName.main;
          }
          return RouteName.splashscreen;
        },
      ),
      GoRoute(
        path: '/',
        name: RouteName.main,
        builder: (context, state) => const MainPage(id: 0),
      ),
      GoRoute(
        path: '/recipe-page',
        name: RouteName.recipePage,
        builder: (context, state) => const RecipePage(),
      ),
      GoRoute(
        path: '/weekly-report-page',
        name: RouteName.weeklyReportPage,
        builder: (context, state) => const WeeklyReportPage(),
      ),
      GoRoute(
        path: '/edit-profile-page',
        name: RouteName.editProfilePage,
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/login-page',
        name: RouteName.loginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/sign-up-page',
        name: RouteName.signUpPage,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/add-recipe-page',
        name: RouteName.addRecipePage,
        builder: (context, state) => const AddRecipePage(),
      ),
      GoRoute(
        path: '/add-ingredient-page',
        name: RouteName.addIngredientPage,
        builder: (context, state) => const AddIngredientsPage(),
      ),
      GoRoute(
        path: '/preview-recipe-page',
        name: RouteName.previewRecipePage,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return PreviewRecipePage(
            previewRecipePageArgs: PreviewRecipePageArgs.fromJson(extra),
          );
        },
      ),
      GoRoute(
        path: '/recipes',
        name: RouteName.detailRecipePage,
        builder: (context, state) {
          return const DetailRecipePage();
        },
      ),
      GoRoute(
        path: '/add-meals/:id',
        name: RouteName.addMealsPage,
        builder: (context, state) {
          final mealId = state.pathParameters['mealId']!;
          return AddMealsPage(mealId: mealId);
        },
      ),
      GoRoute(
        path: '/plan-page',
        name: RouteName.planPage,
        builder: (context, state) => const PlanPage(),
      ),
      GoRoute(
        path: '/detail-meal/:id/:name',
        name: RouteName.detailMealPage,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final name = state.pathParameters['name']!;
          return DetailMealPage(id: id, name: name);
        },
      ),
      GoRoute(
        path: '/preview-meal/:id/:name',
        name: RouteName.previewMealPage,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final name = state.pathParameters['name']!;
          return PreviewMealPage(id: id, name: name);
        },
      ),
      GoRoute(
        path: '/item-detail-meal/:id/:name/:type',
        name: RouteName.itemDetailMealPage,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final name = state.pathParameters['name']!;
          final type = state.pathParameters['type']!;
          return ItemDetailMealPage(id: id, name: name, type: type);
        },
      ),
      GoRoute(
        path: '/item-preview-meal/:id/:name/:type',
        name: RouteName.itemPreviewMealPage,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final name = state.pathParameters['name']!;
          final type = state.pathParameters['type']!;
          final extra = state.extra as Map<String, dynamic>;

          return ItemPreviewMealPage(
            id: id,
            name: name,
            type: type,
            size: (extra['size'] ?? 0).toDouble(),
            calories: (extra['calories'] ?? 0).toDouble(),
            carbs: (extra['carbs'] ?? 0).toDouble(),
            protein: (extra['protein'] ?? 0).toDouble(),
            fat: (extra['fat'] ?? 0).toDouble(),
          );
        },
      ),
    ],
  );
}
