import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final RegisterUseCase _registerUseCase;

  SignupCubit(this._registerUseCase) : super(SignupInitial());

  void signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required int userType,
    required int gender,
    required String dateOfBirth,
    required String phoneNumber,
    required int countryId,
  }) async {
    emit(SignupLoading());
    
    final result = await _registerUseCase.call(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      userType: userType,
      gender: gender,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
      countryId: countryId,
    );

    result.fold(
      (failure) => emit(SignupFailure(failure.message)),
      (auth) => emit(SignupSuccess()),
    );
  }
}
