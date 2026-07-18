import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dipe_freelance/core/errors/failures.dart';
import '../entities/project_entity.dart';
import '../repositories/jobs_repository.dart';

@injectable
class GetJobsUseCase {
  final JobsRepository repository;
  GetJobsUseCase(this.repository);

  Future<Either<Failure, List<ProjectEntity>>> call({String? search}) {
    return repository.getJobMatches(search: search);
  }
}
