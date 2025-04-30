import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/profile/controllers/put_profile_controllers.dart';
import 'package:nutri_call_app/features/profile/domain/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository_impl.g.dart';

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final httpClient = ref.watch(dioProvider);
  return ProfileRepositoryImpl(httpClient: httpClient);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final Dio httpClient;

  ProfileRepositoryImpl({required this.httpClient});

  @override
  Future<Either<String, Map<String, dynamic>>> putProfile(
      {required ProfileParams params}) async {
    final Map<String, dynamic> formMap = {};

    if (params.imageUrl != null) {
      final file = await MultipartFile.fromFile(
        params.imageUrl!.path,
        filename: params.imageUrl!.name,
      );
      formMap['image_url'] = file;
    }
    if (params.fullName!.isNotEmpty) formMap['full_name'] = params.fullName;
    if (params.username!.isNotEmpty) formMap['username'] = params.username;
    if (params.age! > 0) formMap['age'] = params.age;
    if (params.weight! > 0) formMap['weight'] = params.weight;
    if (params.weightTarget! > 0) {
      formMap['weight_target'] = params.weightTarget;
    }
    if (params.height! > 0) formMap['height'] = params.height;
    if (params.bmi! > 0) formMap['bmi'] = params.bmi;
    if (params.gender!.isNotEmpty) formMap['gender'] = params.gender;
    if (params.fa!.isNotEmpty) formMap['fa'] = params.fa;

    final formData = FormData.fromMap(formMap);

    try {
      final response =
          await httpClient.put('/auth/edit-profile', data: formData);
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
