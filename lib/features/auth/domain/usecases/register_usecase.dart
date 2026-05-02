class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) {
    return repository.registerWithEmail(
      email: email,
      password: password,
      name: name,
      userType: userType,
    );
  }
}// domain/usecases/register_usecase.dart
class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) {
    return repository.registerWithEmail(
      email: email,
      password: password,
      name: name,
      userType: userType,
    );
  }
}