class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<Either<Failure, User>> call(String email, String password) {
    return repository.loginWithEmail(email, password);
  }
}