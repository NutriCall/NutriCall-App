import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/home/domain/entities/cal_today_model.dart';
import 'package:nutri_call_app/features/home/domain/entities/current_user_model.dart';

abstract class CurrentUserRepository {
  Future<Either<String, CurrentUserModel>> getCurrentUser(
      {required Map<String, String> headers});
  Future<Either<String, CalTodayModel>> getCalToday();
}
