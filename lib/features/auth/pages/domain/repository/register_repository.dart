import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/auth/pages/controllers/post_register_controllers.dart';

abstract class RegisterRepository {
  Future<Either<String, Map<String, dynamic>>> postRegister(
      {required RegisterParams params});
}
