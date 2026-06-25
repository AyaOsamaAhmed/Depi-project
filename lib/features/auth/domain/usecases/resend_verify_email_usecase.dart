import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

@injectable
class ResendVerifyEmailUseCase {
  final AuthRepository repository;
  ResendVerifyEmailUseCase(this.repository);

  Future<Either<Failure, void>> call(String email) {
    return repository.resendVerifyEmail(email);
  }
}
