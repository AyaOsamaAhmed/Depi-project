import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    
    final result = await _loginUseCase.call(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (auth) => emit(LoginSuccess(auth)),
    );
  }
}
