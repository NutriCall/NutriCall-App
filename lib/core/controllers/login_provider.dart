import 'package:nutri_call_app/core/controllers/authentication_impl_provider.dart';
import 'package:nutri_call_app/core/domain/usecases/login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) {
  return Login(
      authenticationRepository: ref.read(authenticationRepositoryProvider));
}
