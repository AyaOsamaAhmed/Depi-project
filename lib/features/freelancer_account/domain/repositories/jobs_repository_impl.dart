import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dipe_freelance/core/errors/failures.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/jobs_repository.dart';
import '../../data/datasources/jobs_remote_datasource.dart';

@LazySingleton(as: JobsRepository)
class JobsRepositoryImpl implements JobsRepository {
  final JobsRemoteDataSource remoteDataSource;

  JobsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await remoteDataSource.getCategories();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Error fetching categories'));
    } catch (e) {
      return Left(ServerFailure('تأكد من الاتصال بالإنترنت'));
    }
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> getJobMatches({
    String? search,
  }) async {
    try {
      final result = await remoteDataSource.getJobMatches(search: search);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Error fetching jobs'));
    } catch (e) {
      return Left(ServerFailure('تأكد من الاتصال بالإنترنت'));
    }
  }
}
