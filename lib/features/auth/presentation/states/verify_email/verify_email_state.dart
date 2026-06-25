abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailResendSuccess extends VerifyEmailState {
  final String message;
  VerifyEmailResendSuccess(this.message);
}

class VerifyEmailFailure extends VerifyEmailState {
  final String message;
  VerifyEmailFailure(this.message);
}
