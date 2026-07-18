import 'package:dio/dio.dart';
import 'package:dipe_freelance/core/network/end_points.dart';
import 'package:dipe_freelance/features/freelancer_account/data/models/category_model.dart';
import 'package:dipe_freelance/features/freelancer_account/data/models/project_api_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dipe_freelance/features/freelancer_account/domain/entities/project_entity.dart';
import 'package:dipe_freelance/features/freelancer_account/domain/repositories/jobs_repository.dart';

abstract class JobsRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProjectApiModel>> getJobMatches({String? search});
}

@LazySingleton(as: JobsRemoteDataSource)
class JobsRemoteDataSourceImpl implements JobsRemoteDataSource {
  final Dio dio;
  JobsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get(EndPoints.apiCategories);
    final List data = response.data as List;
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<ProjectApiModel>> getJobMatches({String? search}) async {
    final queryParams = <String, dynamic>{};
    if (search != null && search.isNotEmpty) {
      queryParams['Search'] = search;
    }
    final response = await dio.get(
      EndPoints.apiJobsMatches,
      queryParameters: queryParams,
    );
    final List data = response.data as List;
    return data.map((e) => ProjectApiModel.fromJson(e)).toList();
  }
}
