import 'package:bloc/bloc.dart';
import 'package:dipe_freelance/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:dipe_freelance/features/auth/domain/usecases/refresh_token.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/state/splash_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final RefreshTokenUseCase _refreshTokenUseCase;
  final AuthLocalDataSource _authLocalDataSource;

  SplashCubit(this._refreshTokenUseCase, this._authLocalDataSource)
    : super(SplashInitial());

  Future<void> _getlocalData() async {
    String? token = await _authLocalDataSource.getAccessToken();
    String? userType = await _authLocalDataSource.getUserType();
  }

  Future<void> refreshToken() async {
    // Clear previous login credentials to force: Splash -> Onboarding -> Sign In
    await _authLocalDataSource.clearAuthData();
    
    if (isClosed) return;
    emit(SplashChecking(false, null));

    /* 
    // To restore auto-login redirection, uncomment this:
    String? refreshToken = await _authLocalDataSource.getRefreshToken();
    print('refresh token  :  $refreshToken');

    final result = await _refreshTokenUseCase(refreshToken ?? '');

    print(result);
    if (isClosed) return;
    result.fold(
      (failure) => {
        print("fauilure ${failure}"),
        emit(SplashChecking(false, null)),
      },
      (auth) => {
        _authLocalDataSource.saveAuthData(auth.toModel()),
        emit(SplashChecking(true, auth.user.userType.toString())),
      },
    );
    */
  }

  @override
  void emit(SplashState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
