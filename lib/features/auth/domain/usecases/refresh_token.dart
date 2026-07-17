import 'package:dartz/dartz.dart';
import 'package:dipe_freelance/features/auth/domain/entities/auth_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

@injectable
class RefreshTokenUseCase {
  final AuthRepository repository;
  RefreshTokenUseCase(this.repository);

  Future<Either<Failure, AuthEntity>> call(String token) {
    return repository.refreshToken(token);
  }
}
