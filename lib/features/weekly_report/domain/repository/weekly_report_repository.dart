import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_calories_report_model.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_macros_report_model.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_graph_calories_model.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_resume_report_model.dart';

abstract class WeeklyReportRepository {
  Future<Either<String, WeeklyCaloriesReportModel>> getWeeklyCaloriesReport();
  Future<Either<String, WeeklyMacrosReportModel>> getWeeklyMacrosReport();
  Future<Either<String, WeeklyGraphCaloriesModel>>
      getWeeklyGraphCaloriesReport();
  Future<Either<String, WeeklyResumeReportModel>> getWeeklyResumeReport();
}
