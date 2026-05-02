class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> loginWithEmail(
      String email, String password) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure('No internet connection'));
    }
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(userModel);
    } on UnauthorizedException {
      return Left(AuthFailure('Invalid email or password'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

}