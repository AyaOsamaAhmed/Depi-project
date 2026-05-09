import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  void signup(String firstName, String lastName, String email, String password) async {
    emit(SignupLoading());
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    emit(SignupSuccess());
  }
}
