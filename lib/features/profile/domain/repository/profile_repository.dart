import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/profile/controllers/put_profile_controllers.dart';

abstract class ProfileRepository {
  Future<Either<String, Map<String, dynamic>>> putProfile(
      {required ProfileParams params});
}
