import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/report/domain/entities/daily_calorie_report_model.dart';
import 'package:nutri_call_app/features/report/domain/entities/food_eaten_report_model.dart';
import 'package:nutri_call_app/features/report/domain/entities/macronutrient_report_model.dart';

abstract class DailyReportRepository {
  Future<Either<String, DailyCalorieReportModel>> getDailyCalorieReport();
  Future<Either<String, FoodEatenReportModel>> getFoodEatenReport();
  Future<Either<String, MacronutrientReportModel>> getMacronutrientReport();
}
