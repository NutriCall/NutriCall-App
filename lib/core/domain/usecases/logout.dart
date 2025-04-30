import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/core/domain/repository/authentication_repository.dart';
import 'package:nutri_call_app/utils/usecase/usecase.dart';

class Logout implements UseCase<String, void> {
  final AuthenticationRepository authenticationRepository;

  Logout({required this.authenticationRepository});

  @override
  Future<Either<String, String>> call(void params) async {
    return authenticationRepository.logout();
  }
}
