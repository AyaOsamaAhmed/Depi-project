abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashChecking extends SplashState {
  final bool isLoggin;
  final String? userType;

  SplashChecking(this.isLoggin, this.userType);
}
