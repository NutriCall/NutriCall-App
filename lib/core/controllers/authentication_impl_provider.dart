import 'package:nutri_call_app/core/data/datasources/authentication_remote_datasource.dart/authentication_remote_datasource.dart';
import 'package:nutri_call_app/core/data/repositories/authentication_repository_impl.dart';
import 'package:nutri_call_app/core/domain/repository/authentication_repository.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_impl_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
    remoteDataSource: AuthenticationRemoteDataSourceImpl(
      httpClient: ref.watch(dioProvider),
    ),
  );
}
