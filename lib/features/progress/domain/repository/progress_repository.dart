import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/progress/domain/entities/nutrition_progress_model.dart';
import 'package:nutri_call_app/features/progress/domain/entities/weight_progress_model.dart';

abstract class ProgressRepository {
  Future<Either<String, NutritionProgressModel>> getNutritionProgress();
  Future<Either<String, WeightProgressModel>> getWeightProgress();
}
