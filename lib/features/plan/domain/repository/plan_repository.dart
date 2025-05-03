import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/plan/domain/entities/list_composition_model.dart';
import 'package:nutri_call_app/features/plan/domain/entities/meal_plan_model.dart';

abstract class PlanRepository {
  Future<Either<String, List<ListCompositionModel>>> getCompositions({
    required String namaBahan,
  });
  Future<Either<String, List<MealPlanModel>>> getMealPlan();
}
