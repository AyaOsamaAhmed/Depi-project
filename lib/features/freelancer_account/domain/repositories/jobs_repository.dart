import 'package:dartz/dartz.dart';
import '../entities/category_entity.dart';
import '../entities/project_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class JobsRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProjectEntity>>> getJobMatches({String? search});
}
