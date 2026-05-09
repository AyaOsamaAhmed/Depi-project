import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart' show AuthRepository;

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<Either<Failure, AuthEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}