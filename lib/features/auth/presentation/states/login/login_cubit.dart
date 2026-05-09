import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));
    
    // Simulate a backend check
    if (email == 'test@test.com' && password == '123456') {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure('invalidCredentials'));
    }
  }
}
