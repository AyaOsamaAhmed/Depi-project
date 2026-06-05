import '../../../domain/entities/auth_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthEntity authEntity;
  LoginSuccess(this.authEntity);
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
