import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/auth/pages/controllers/post_register_controllers.dart';
import 'package:nutri_call_app/features/auth/pages/domain/repository/register_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_repository_impl.g.dart';

@riverpod
RegisterRepository registerRepository(RegisterRepositoryRef ref) {
  final httpClient = ref.watch(dioProvider);
  return RegisterRepositoryImpl(httpClient: httpClient);
}

class RegisterRepositoryImpl implements RegisterRepository {
  final Dio httpClient;

  RegisterRepositoryImpl({required this.httpClient});

  @override
  Future<Either<String, Map<String, dynamic>>> postRegister(
      {required RegisterParams params}) async {
    final formData = FormData.fromMap({
      'full_name': params.fullName,
      'username': params.username,
      'password': params.password,
      'weight': params.weight,
      'weight_target': params.weightTarget,
      'height': params.height,
      'gender': params.gender,
      'bmi': params.bmi,
      'fa': params.fa,
      'age': params.age,
    });

    try {
      final response = await httpClient.post('/auth/signup', data: formData);
      if (response.statusCode == 200) {
        return Right(response.data['data']);
      } else {
        return Left(
            'Failed to post register with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return Left('${e.response?.data["message"]}');
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
