import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/core/domain/entities/user_model.dart';
import 'package:nutri_call_app/core/domain/repository/authentication_repository.dart';
import 'package:nutri_call_app/utils/usecase/usecase.dart';

class GetUser implements UseCase<UserModel, void> {
  final AuthenticationRepository authenticationRepository;

  GetUser({required this.authenticationRepository});

  @override
  Future<Either<String, UserModel>> call(void params) async {
    return authenticationRepository.getUser();
  }
}
