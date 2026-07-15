import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dipe_freelance/core/errors/failures.dart';
import '../entities/category_entity.dart';
import '../repositories/jobs_repository.dart';

@injectable
class GetCategoriesUseCase {
  final JobsRepository repository;
  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return repository.getCategories();
  }
}
