import 'package:go_router/go_router.dart';
import 'package:nutri_call_app/features/auth/pages/sign_up_page.dart';
import 'package:nutri_call_app/features/main/pages/main_page.dart';
import 'package:nutri_call_app/features/plan/pages/add_meals_page.dart';
import 'package:nutri_call_app/features/plan/pages/plan_page.dart';
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
        builder: (context, state) => const PreviewRecipePage(),
      ),
      GoRoute(
        path: '/recipes/:id',
        name: RouteName.detailRecipePage,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailRecipePage(id: id);
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
      )
    ],
  );
}
