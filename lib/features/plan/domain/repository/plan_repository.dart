import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/plan/domain/entities/list_composition_model.dart';
import 'package:nutri_call_app/features/plan/domain/entities/meal_plan_model.dart';
import 'package:nutri_call_app/features/plan/domain/entities/temporary_meal_model.dart';
import 'package:nutri_call_app/features/plan/controllers/post_calculate_nutrients_controller.dart';
import 'package:nutri_call_app/features/plan/controllers/post_temporary_controller.dart';
import 'package:nutri_call_app/features/plan/controllers/post_add_meals_controller.dart';

abstract class PlanRepository {
  Future<Either<String, List<ListCompositionModel>>> getCompositions({
    required String namaBahan,
  });
  Future<Either<String, List<MealPlanModel>>> getMealPlan();
  Future<Either<String, Map<String, dynamic>>> postCalculateNutrients({
    required CalculateNutrientParams params,
  });
  Future<Either<String, Map<String, dynamic>>> postTemporary({
    required PostTemporaryParams params,
  });
  Future<Either<String, List<TemporaryMealModel>>> getTemporaryMeals({
    required String type,
  });
  Future<Either<String, List<dynamic>>> postAddMeals({
    required AddMealsParams params,
  });
}
